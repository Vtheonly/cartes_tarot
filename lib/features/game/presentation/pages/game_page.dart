import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/entities/card.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/trick.dart';
import '../../domain/enums/card_type.dart';
import '../../domain/enums/rank.dart';
import '../../domain/enums/suit.dart';
import '../controller/game_controller.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  final GameController controller;
  const GamePage({super.key, required this.controller});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Player humanPlayer;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    humanPlayer = widget.controller.players.firstWhere((p) => p.isHuman);
    _startNewRound();
  }

  // ==========================================
  // GESTION DES TOURS
  // ==========================================

  void _startNewRound() {
    if (widget.controller.isGameOver) {
      _showGameOverDialog();
      return;
    }

    final turnNumber = widget.controller.getNextTurnNumber();

    if (turnNumber < 1) {
      // Manche terminée, recommencer
      _showMancheCompleteDialog();
      return;
    }

    widget.controller.startNewRound(turnNumber);
    setState(() {});

    // Démarrer la phase d'annonces
    _processBiddingPhase();
  }

  // ==========================================
  // PHASE D'ANNONCES
  // ==========================================

  Future<void> _processBiddingPhase() async {
    while (!widget.controller.areBidsComplete) {
      final nextBidder = widget.controller.nextBidder;
      if (nextBidder == null) break;

      if (nextBidder.isHuman) {
        // Tour du joueur humain
        await _showHumanBidDialog();
      } else {
        // Tour du robot
        await Future.delayed(const Duration(milliseconds: 800));
        final aiBid = _generateAIBid(nextBidder);
        widget.controller.placeBid(nextBidder, aiBid);

        _showSnackBar('${nextBidder.name} annonce $aiBid pli(s)');
        setState(() {});
      }
    }

    // Annonces terminées, commencer le jeu
    setState(() {});
    _processPlayPhase();
  }

  Future<void> _showHumanBidDialog() async {
    final validBids = widget.controller.getValidBidsForPlayer(humanPlayer);

    final selectedBid = await showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Votre Annonce'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cartes en main : ${humanPlayer.hand.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Choisissez le nombre de plis que vous comptez faire :'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: validBids.map((bid) {
                return ElevatedButton(
                  onPressed: () => Navigator.pop(context, bid),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60, 50),
                    backgroundColor: Colors.blue.shade600,
                  ),
                  child: Text(
                    '$bid',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );

    if (selectedBid != null) {
      widget.controller.placeBid(humanPlayer, selectedBid);
      _showSnackBar('Vous annoncez $selectedBid pli(s)');
      setState(() {});
    }
  }

  int _generateAIBid(Player ai) {
    final validBids = widget.controller.getValidBidsForPlayer(ai);

    // Stratégie simple : compter les atouts
    final trumpCount = ai.hand.where((c) => c.type == CardType.trump).length;
    final targetBid = (trumpCount / 2).ceil();

    // Choisir l'annonce valide la plus proche
    int closestBid = validBids.first;
    int minDiff = (closestBid - targetBid).abs();

    for (final bid in validBids) {
      final diff = (bid - targetBid).abs();
      if (diff < minDiff) {
        minDiff = diff;
        closestBid = bid;
      }
    }

    return closestBid;
  }

  // ==========================================
  // PHASE DE JEU
  // ==========================================

  Future<void> _processPlayPhase() async {
    while (!widget.controller.isRoundComplete) {
      final nextPlayer = widget.controller.nextPlayer;
      if (nextPlayer == null) break;

      if (nextPlayer.isHuman) {
        // Tour du joueur humain - attend l'interaction
        return;
      } else {
        // Tour du robot
        await Future.delayed(const Duration(milliseconds: 1000));
        final aiCard = _chooseAICard(nextPlayer);
        _playCard(nextPlayer, aiCard);
      }
    }

    // Tour terminé
    _showRoundCompleteDialog();
  }

  void _playCard(Player player, TarotCard card) {
    if (isProcessing) return;

    final success = widget.controller.playCard(player, card);

    if (!success) {
      _showSnackBar('Carte invalide !', error: true);
      return;
    }

    setState(() {});

    // Vérifier si le pli est terminé
    final trick = widget.controller.currentTrick;
    if (trick != null && trick.isComplete(widget.controller.players.length)) {
      _handleTrickComplete(trick);
    } else {
      // Continuer le jeu automatique si nécessaire
      if (!widget.controller.isRoundComplete) {
        _processPlayPhase();
      }
    }
  }

  void _handleTrickComplete(Trick trick) {
    final winner = trick.winnerName;

    Future.delayed(const Duration(milliseconds: 500), () {
      _showSnackBar('$winner remporte le pli !', duration: 2);

      // Continuer le jeu si le tour n'est pas terminé
      if (!widget.controller.isRoundComplete) {
        _processPlayPhase();
      }
    });
  }

  TarotCard _chooseAICard(Player ai) {
    final hand = List<TarotCard>.from(ai.hand);

    // Stratégie simple : jouer la carte la plus faible
    hand.sort((a, b) {
      if (a.isExcuse) return -1;
      if (b.isExcuse) return 1;

      if (a.type == CardType.trump && b.type == CardType.trump) {
        return a.trumpValue!.compareTo(b.trumpValue!);
      }

      if (a.type == CardType.trump) return 1;
      if (b.type == CardType.trump) return -1;

      return a.rank!.index.compareTo(b.rank!.index);
    });

    return hand.first;
  }

  // ==========================================
  // DIALOGUES
  // ==========================================

  void _showRoundCompleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tour Terminé !'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.controller.players.map((player) {
              final success = player.tricksWon == player.bid;
              return ListTile(
                leading: Icon(
                  success ? Icons.check_circle : Icons.cancel,
                  color: success ? Colors.green : Colors.red,
                ),
                title: Text(player.name),
                subtitle: Text(
                  'Annoncé: ${player.bid} | Réalisé: ${player.tricksWon}',
                ),
                trailing: Text(
                  '${player.score} pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _getScoreColor(player.score),
                  ),
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _startNewRound();
              },
              child: const Text('Tour Suivant'),
            ),
          ],
        );
      },
    );
  }

  void _showMancheCompleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Manche Terminée !'),
        content: const Text('Voulez-vous continuer une nouvelle manche ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Quitter'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Recommencer une manche complète (5→4→3→2→1)
              _startNewRound();
            },
            child: const Text('Nouvelle Manche'),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog() {
    final winner = widget.controller.winner;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🏆 Partie Terminée !'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${winner?.name ?? "Inconnu"} remporte la partie !',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Score final : ${winner?.score ?? 0} points',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            ...widget.controller.leaderboard.map((player) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      _getScoreColor(player.score).withOpacity(0.2),
                  child: Text('${player.score}'),
                ),
                title: Text(player.name),
                trailing: player == winner
                    ? const Icon(Icons.emoji_events, color: Colors.amber)
                    : null,
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Retour au Menu'),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // UI
  // ==========================================

  @override
  Widget build(BuildContext context) {
    final round = widget.controller.currentRound;
    if (round == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isBiddingPhase = !widget.controller.areBidsComplete;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tour ${round.turnNumber} - ${_getPhaseText()}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showGameStats,
          ),
        ],
      ),
      body: Column(
        children: [
          // Barre de scores
          _buildScoreBar(),

          const Divider(height: 1),

          // Zone principale
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Phase d'annonces ou de jeu
                  if (isBiddingPhase) _buildBiddingInfo() else _buildPlayInfo(),

                  const SizedBox(height: 16),

                  // Main du joueur
                  _buildPlayerHand(),

                  const SizedBox(height: 16),

                  // Historique des plis
                  Expanded(child: _buildTricksHistory()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.blue.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.controller.players.map((player) {
          return Column(
            children: [
              Text(
                player.name,
                style: TextStyle(
                  fontWeight:
                      player.isHuman ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${player.score}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _getScoreColor(player.score),
                ),
              ),
              if (player.bid != null)
                Text(
                  'Annonce: ${player.bid} | Plis: ${player.tricksWon}',
                  style: const TextStyle(fontSize: 11),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBiddingInfo() {
    final nextBidder = widget.controller.nextBidder;

    return Card(
      color: Colors.amber.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              '📢 Phase d\'Annonces',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              nextBidder == null
                  ? 'Annonces terminées'
                  : '${nextBidder.name} doit annoncer...',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayInfo() {
    final nextPlayer = widget.controller.nextPlayer;
    final currentTrick = widget.controller.currentTrick;

    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              '🎴 Phase de Jeu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (nextPlayer != null)
              Text(
                '${nextPlayer.name} doit jouer',
                style: const TextStyle(fontSize: 16),
              ),
            if (currentTrick != null && currentTrick.plays.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Wrap(
                  spacing: 8,
                  children: currentTrick.plays.map((play) {
                    return Chip(
                      avatar: CircleAvatar(
                        backgroundColor: _getPlayerColor(play.playerName),
                        child: Text(
                          play.playerName[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      label: Text(play.card.toString()),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerHand() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Votre Main',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: humanPlayer.hand.isEmpty
                  ? const Center(child: Text('Plus de cartes'))
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: humanPlayer.hand.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, index) {
                        final card = humanPlayer.hand[index];
                        final isPlayable =
                            widget.controller.nextPlayer == humanPlayer;

                        return GestureDetector(
                          onTap: isPlayable
                              ? () => _playCard(humanPlayer, card)
                              : null,
                          child: _buildCardWidget(card, isPlayable),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWidget(TarotCard card, bool isPlayable) {
    Color cardColor;
    if (card.isExcuse) {
      cardColor = Colors.purple.shade100;
    } else if (card.type == CardType.trump) {
      cardColor = Colors.red.shade100;
    } else {
      cardColor = Colors.blue.shade50;
    }

    return Opacity(
      opacity: isPlayable ? 1.0 : 0.5,
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPlayable ? Colors.blue.shade700 : Colors.grey,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _formatCardText(card),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String _formatCardText(TarotCard card) {
    if (card.isExcuse) return '🃏\nExcuse';
    if (card.type == CardType.trump) return '🎺\n${card.trumpValue}';

    final suitEmoji = {
      Suit.heart: '♥️',
      Suit.diamond: '♦️',
      Suit.club: '♣️',
      Suit.spade: '♠️',
    }[card.suit];

    final rankText = {
          Rank.ace: 'A',
          Rank.king: 'K',
          Rank.queen: 'Q',
          Rank.knight: 'C',
          Rank.jack: 'V',
        }[card.rank] ??
        '${card.rank!.value}';

    return '$suitEmoji\n$rankText';
  }

  Widget _buildTricksHistory() {
    final tricks =
        widget.controller.allTricks.where((t) => t.plays.isNotEmpty).toList();

    if (tricks.isEmpty) {
      return const Center(
        child: Text('Aucun pli joué pour le moment'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Historique des Plis',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: tricks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final trick = tricks[index];
              return _buildTrickCard(trick, index + 1);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrickCard(Trick trick, int number) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Pli $number',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (trick.winnerName != null) ...[
                  const Spacer(),
                  Icon(Icons.emoji_events,
                      size: 16, color: Colors.amber.shade700),
                  const SizedBox(width: 4),
                  Text(
                    trick.winnerName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade700,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: trick.plays.map((play) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getPlayerColor(play.playerName).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getPlayerColor(play.playerName),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        play.playerName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _formatCardText(play.card),
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // UTILS
  // ==========================================

  String _getPhaseText() {
    if (!widget.controller.areBidsComplete) {
      return 'Annonces';
    }
    return 'Jeu';
  }

  void _showGameStats() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Statistiques'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Tour actuel : ${widget.controller.currentRound?.turnNumber ?? 0}'),
            Text('Manche : ${widget.controller.game?.roundNumber ?? 0}'),
            const SizedBox(height: 16),
            ...widget.controller.players.map((p) {
              return ListTile(
                title: Text(p.name),
                subtitle:
                    Text('Annonce: ${p.bid ?? '-'} | Plis: ${p.tricksWon}'),
                trailing: Text('${p.score} pts'),
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message, {bool error = false, int duration = 1}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
        backgroundColor: error ? Colors.red : null,
      ),
    );
  }

  Color _getScoreColor(int score) {
    if (score <= 2) return Colors.red;
    if (score <= 5) return Colors.orange;
    if (score <= 7) return Colors.green;
    return Colors.teal;
  }

  Color _getPlayerColor(String playerName) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    return colors[playerName.hashCode.abs() % colors.length];
  }
}

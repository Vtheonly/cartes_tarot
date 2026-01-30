import '../entities/card.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../entities/round.dart';
import '../entities/trick.dart';
import '../usecases/calculate_trick_winner.dart';
import '../usecases/distribute_cards.dart';
import '../usecases/place_bid.dart';
import '../usecases/play_card.dart';
import '../usecases/score_round.dart';
import '../usecases/start_game.dart';
import '../usecases/start_round.dart';

class GameEngine {
  final StartGame _startGame = StartGame();
  final StartRound _startRound = StartRound();
  final DistributeCards _distributeCards = DistributeCards();
  final PlaceBid _placeBid = PlaceBid();
  final PlayCard _playCard = PlayCard();
  final CalculateTrickWinner _calculateTrickWinner = CalculateTrickWinner();
  final ScoreRound _scoreRound = ScoreRound();

  Game? _game;

  // ======================================
  // DÉMARRAGE DE LA PARTIE
  // ======================================

  /// Démarre une nouvelle partie avec [playersCount] joueurs
  Game startGame(int playersCount, {int humanPlayers = 1}) {
    _game = _startGame(playersCount, humanPlayers: humanPlayers);

    // Distribuer les cartes ordinaires (une fois pour toute la partie)
    _distributeCards.distributeOrdinaryCards(_game!);

    return _game!;
  }

  // ======================================
  // DÉMARRAGE D'UN TOUR
  // ======================================

  /// Démarre un nouveau tour avec [turnNumber] cartes par joueur (5→4→3→2→1)
  Round startRound(int turnNumber) {
    if (_game == null) {
      throw Exception("La partie n'est pas initialisée");
    }

    // Créer le nouveau tour
    final round = _startRound(_game!, turnNumber);

    // Distribuer les cartes spéciales (atouts + excuse)
    _distributeCards.distributeSpecialCards(_game!, turnNumber);

    // Initialiser le premier pli
    round.tricks.add(Trick());

    return round;
  }

  // ======================================
  // GESTION DES ANNONCES
  // ======================================

  /// Place l'annonce d'un joueur
  bool placeBid(Player player, int bid) {
    if (_game == null || _game!.currentRound == null) {
      throw Exception("Aucun tour en cours");
    }

    return _placeBid(player, bid, _game!);
  }

  /// Retourne les annonces valides pour un joueur
  List<int> getValidBids(Player player) {
    if (_game == null) {
      throw Exception("La partie n'est pas initialisée");
    }

    return _placeBid.getValidBids(player, _game!);
  }

  /// Vérifie si toutes les annonces sont complètes
  bool get areBidsComplete {
    if (_game == null) return false;
    return _game!.players.every((p) => p.bid != null);
  }

  /// Retourne le prochain joueur devant annoncer
  Player? get nextBidder {
    if (_game == null || _game!.currentRound == null) return null;

    final round = _game!.currentRound!;
    int startIndex = (round.dealerIndex + 1) % _game!.playersCount;

    for (int i = 0; i < _game!.playersCount; i++) {
      final playerIndex = (startIndex + i) % _game!.playersCount;
      final player = _game!.players[playerIndex];
      if (player.bid == null) {
        return player;
      }
    }

    return null;
  }

  // ======================================
  // GESTION DU JEU DES CARTES
  // ======================================

  /// Joue une carte pour un joueur
  bool playCard(Player player, TarotCard card) {
    if (_game == null || _game!.currentRound == null) {
      throw Exception("Aucun tour en cours");
    }

    final round = _game!.currentRound!;

    // Jouer la carte
    if (!_playCard(player, card, round)) {
      return false;
    }

    // Vérifier si le pli est complet
    if (round.currentTrick.isComplete(_game!.playersCount)) {
      _finalizeTrick();
    }

    return true;
  }

  /// Retourne le prochain joueur devant jouer
  Player? get nextPlayer {
    if (_game == null || _game!.currentRound == null) return null;

    final round = _game!.currentRound!;
    final currentTrick = round.currentTrick;

    // Si le pli est vide, c'est le tour de currentPlayerIndex
    if (currentTrick.plays.isEmpty) {
      return _game!.players[round.currentPlayerIndex];
    }

    // Sinon, le joueur suivant dans l'ordre
    final lastPlayerName = currentTrick.plays.last.playerName;
    final lastPlayerIndex =
        _game!.players.indexWhere((p) => p.name == lastPlayerName);
    final nextIndex = (lastPlayerIndex + 1) % _game!.playersCount;

    return _game!.players[nextIndex];
  }

  // ======================================
  // FINALISATION D'UN PLI
  // ======================================

  void _finalizeTrick() {
    final round = _game!.currentRound!;
    final trick = round.currentTrick;

    // Calculer le gagnant
    final winnerName = _calculateTrickWinner(trick);
    trick.winnerName = winnerName;

    // Incrémenter le compteur de plis du gagnant
    final winner = _game!.players.firstWhere((p) => p.name == winnerName);
    winner.tricksWon += 1;

    // Mettre à jour l'index du joueur actuel pour le prochain pli
    final winnerIndex = _game!.players.indexOf(winner);
    round.currentPlayerIndex = winnerIndex;

    // Créer un nouveau pli si des cartes restent
    if (_game!.players.first.hand.isNotEmpty) {
      round.tricks.add(Trick());
    } else {
      _endRound();
    }
  }

  // ======================================
  // FIN DE TOUR
  // ======================================

  void _endRound() {
    if (_game == null) return;

    // Calculer les scores
    _scoreRound(_game!);

    // Passer au donneur suivant
    _game!.rotateDealer();

    // Incrémenter le numéro de manche
    _game!.roundNumber++;
  }

  // ======================================
  // UTILITAIRES
  // ======================================

  /// Vérifie si le tour actuel est terminé
  bool get isRoundComplete {
    if (_game == null || _game!.currentRound == null) return false;

    final round = _game!.currentRound!;
    return round.isComplete;
  }

  /// Calcule le gagnant d'un pli (pour tests ou affichage)
  String calculateTrickWinner(Trick trick) {
    return _calculateTrickWinner(trick);
  }

  // ======================================
  // GETTERS
  // ======================================

  Game? get game => _game;

  Round? get currentRound => _game?.currentRound;

  List<Player> get players => _game?.players ?? [];

  bool get isGameOver => _game?.isGameOver ?? false;

  Player? get winner => _game?.winner;
}

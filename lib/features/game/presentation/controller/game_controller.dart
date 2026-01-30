import '../../domain/entities/game.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/round.dart';
import '../../domain/entities/card.dart';
import '../../domain/entities/trick.dart';
import '../../domain/service/game_engine.dart';

/// Contrôleur principal du jeu - Interface entre l'UI et le Game Engine
class GameController {
  final GameEngine engine;

  GameController(this.engine);

  // ==========================================
  // GESTION DE LA PARTIE
  // ==========================================

  /// Démarre une nouvelle partie avec [playersCount] joueurs
  Game startGame(int playersCount, {int humanPlayers = 1}) {
    return engine.startGame(playersCount, humanPlayers: humanPlayers);
  }

  /// Démarre un nouveau tour avec [turnNumber] cartes par joueur
  /// turnNumber: 5 pour le 1er tour, 4 pour le 2ème, etc.
  Round startNewRound(int turnNumber) {
    return engine.startRound(turnNumber);
  }

  // ==========================================
  // PHASE D'ANNONCES (BIDDING)
  // ==========================================

  /// Le joueur [player] place une annonce de [bid] plis
  /// Retourne true si l'annonce est valide et acceptée
  bool placeBid(Player player, int bid) {
    return engine.placeBid(player, bid);
  }

  /// Retourne les annonces valides pour le joueur actuel
  List<int> getValidBidsForPlayer(Player player) {
    return engine.getValidBids(player);
  }

  /// Retourne le prochain joueur devant annoncer
  /// Retourne null si toutes les annonces sont complètes
  Player? get nextBidder => engine.nextBidder;

  /// Vérifie si toutes les annonces ont été faites
  bool get areBidsComplete => engine.areBidsComplete;

  // ==========================================
  // PHASE DE JEU DES CARTES
  // ==========================================

  /// Le joueur [player] joue la carte [card]
  /// Retourne true si la carte a été jouée avec succès
  bool playCard(Player player, TarotCard card) {
    return engine.playCard(player, card);
  }

  /// Retourne le prochain joueur devant jouer une carte
  Player? get nextPlayer => engine.nextPlayer;

  /// Retourne le pli actuel
  Trick? get currentTrick => engine.currentRound?.currentTrick;

  /// Retourne tous les plis du tour actuel
  List<Trick> get allTricks => engine.currentRound?.tricks ?? [];

  // ==========================================
  // INFORMATIONS SUR L'ÉTAT DU JEU
  // ==========================================

  /// Retourne la partie actuelle
  Game? get game => engine.game;

  /// Retourne le tour actuel
  Round? get currentRound => engine.currentRound;

  /// Retourne la liste de tous les joueurs
  List<Player> get players => engine.players;

  /// Vérifie si le tour actuel est terminé
  bool get isRoundComplete => engine.isRoundComplete;

  /// Vérifie si la partie est terminée (quelqu'un a atteint 0 points)
  bool get isGameOver => engine.isGameOver;

  /// Retourne le gagnant de la partie (celui avec le plus de points)
  Player? get winner => engine.winner;

  /// Retourne le donneur actuel
  Player? get currentDealer => game?.currentDealer;

  // ==========================================
  // SCORING ET STATISTIQUES
  // ==========================================

  /// Retourne le classement des joueurs par score (décroissant)
  List<Player> get leaderboard {
    final playerList = List<Player>.from(players);
    playerList.sort((a, b) => b.score.compareTo(a.score));
    return playerList;
  }

  /// Retourne les statistiques du tour actuel pour affichage
  Map<String, dynamic> getRoundStats() {
    if (currentRound == null) return {};

    return {
      'turnNumber': currentRound!.turnNumber,
      'tricksPlayed': allTricks.where((t) => t.winnerName != null).length,
      'totalTricks': currentRound!.turnNumber,
      'biddingComplete': areBidsComplete,
    };
  }

  /// Retourne les statistiques d'un joueur
  Map<String, dynamic> getPlayerStats(Player player) {
    return {
      'name': player.name,
      'score': player.score,
      'bid': player.bid,
      'tricksWon': player.tricksWon,
      'handSize': player.hand.length,
      'isHuman': player.isHuman,
    };
  }

  // ==========================================
  // UTILITAIRES
  // ==========================================

  /// Calcule le gagnant d'un pli spécifique
  String calculateTrickWinner(Trick trick) {
    return engine.calculateTrickWinner(trick);
  }

  /// Réinitialise complètement le jeu
  void resetGame() {
    // Le game engine sera réinitialisé au prochain startGame()
  }

  /// Retourne le prochain numéro de tour à jouer
  /// Suit la séquence: 5 → 4 → 3 → 2 → 1, puis recommence
  int getNextTurnNumber() {
    if (game == null) return 5;

    final manches = game!.roundNumber;
    final tourInManche = manches % 5;

    // 0→5, 1→4, 2→3, 3→2, 4→1
    return 5 - tourInManche;
  }

  /// Vérifie si c'est le dernier tour de la manche (1 carte)
  bool get isLastTurnOfManche {
    return currentRound?.turnNumber == 1;
  }

  /// Retourne un résumé textuel de l'état actuel du jeu
  String getGameStateDescription() {
    if (game == null) return "Aucune partie en cours";

    if (isGameOver) {
      return "Partie terminée ! Gagnant: ${winner?.name ?? 'Inconnu'}";
    }

    if (currentRound == null) {
      return "En attente du prochain tour...";
    }

    if (!areBidsComplete) {
      return "Phase d'annonces - ${nextBidder?.name ?? 'Inconnu'} doit annoncer";
    }

    if (!isRoundComplete) {
      return "Tour ${currentRound!.turnNumber} - ${nextPlayer?.name ?? 'Inconnu'} doit jouer";
    }

    return "Tour terminé - Calcul des scores...";
  }
}

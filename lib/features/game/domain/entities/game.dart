// ============================================
// GAME.DART - Entité Partie
// ============================================
import 'player.dart';
import 'round.dart';

class Game {
  final int playersCount;
  final List<Player> players;
  int dealerIndex = 0;
  Round? currentRound;
  bool isGameOver = false;
  int roundNumber = 0; // Pour suivre les manches

  Game({
    required this.playersCount,
    required this.players,
  });

  Player get currentDealer => players[dealerIndex];

  /// Joueur qui commence les annonces (à gauche du donneur)
  Player get firstBidder => players[(dealerIndex + 1) % playersCount];

  void rotateDealer() {
    dealerIndex = (dealerIndex + 1) % playersCount;
  }

  /// Obtient le prochain joueur dans l'ordre
  Player getNextPlayer(int currentIndex) {
    return players[(currentIndex + 1) % playersCount];
  }

  /// Vérifie si un joueur a perdu (score <= 0)
  void checkGameOver() {
    for (var player in players) {
      if (player.score <= 0) {
        isGameOver = true;
        break;
      }
    }
  }

  /// Retourne le gagnant (celui avec le plus de points)
  Player? get winner {
    if (!isGameOver) return null;
    return players.reduce((a, b) => a.score > b.score ? a : b);
  }
}

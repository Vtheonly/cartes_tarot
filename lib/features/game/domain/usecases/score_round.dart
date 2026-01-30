// ============================================
// SCORE_ROUND.DART
// ============================================
import '../entities/game.dart';

class ScoreRound {
  void call(Game game) {
    for (var player in game.players) {
      if (player.bid == null) {
        throw Exception("${player.name} n'a pas fait d'annonce");
      }

      final difference = (player.tricksWon - player.bid!).abs();

      if (difference != 0) {
        player.score -= difference;
      }

      // Empêcher les scores négatifs
      if (player.score < 0) {
        player.score = 0;
      }
    }

    // Vérifier si la partie est terminée
    game.checkGameOver();
  }
}

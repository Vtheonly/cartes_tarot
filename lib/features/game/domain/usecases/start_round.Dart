// ============================================
// START_ROUND.DART
// ============================================
import '../entities/game.dart';
import '../entities/round.dart';

class StartRound {
  Round call(Game game, int turnNumber) {
    if (turnNumber < 1 || turnNumber > 5) {
      throw Exception("turnNumber doit être entre 1 et 5");
    }

    // Réinitialiser les joueurs pour le nouveau tour
    for (var player in game.players) {
      player.resetForNewRound();
    }

    final round = Round(
      turnNumber: turnNumber,
      dealerIndex: game.dealerIndex,
    );
    
    game.currentRound = round;
    return round;
  }
}
// ============================================
// ROUND.DART - Entité Tour
// ============================================
import 'trick.dart';

class Round {
  final int turnNumber; // 5, 4, 3, 2, 1 cards per turn
  final List<Trick> tricks = [];
  final int dealerIndex;
  int currentPlayerIndex;
  bool biddingComplete = false;

  Round({
    required this.turnNumber,
    required this.dealerIndex,
  }) : currentPlayerIndex =
            (dealerIndex + 1) % 4; // Le joueur après le donneur commence

  Trick get currentTrick => tricks.last;

  bool get isComplete =>
      tricks.isNotEmpty && tricks.every((t) => t.winnerName != null);
}

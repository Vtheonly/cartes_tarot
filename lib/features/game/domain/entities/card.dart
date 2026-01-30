// ============================================
// CARD.DART - Entité Carte
// ============================================
import '../enums/suit.dart';
import '../enums/rank.dart';
import '../enums/card_type.dart';

class TarotCard {
  final CardType type;
  final Suit? suit;
  final Rank? rank;
  final int? trumpValue; // 1 to 21
  final bool isExcuse;

  const TarotCard.normal({
    required this.suit,
    required this.rank,
  })  : type = CardType.normal,
        trumpValue = null,
        isExcuse = false;

  const TarotCard.trump({
    required this.trumpValue,
  })  : type = CardType.trump,
        suit = null,
        rank = null,
        isExcuse = false;

  const TarotCard.excuse()
      : type = CardType.excuse,
        suit = null,
        rank = null,
        trumpValue = null,
        isExcuse = true;

  @override
  String toString() {
    if (isExcuse) return "Excuse";
    if (type == CardType.trump) return "Trump $trumpValue";
    return "$rank of $suit";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TarotCard &&
        other.type == type &&
        other.suit == suit &&
        other.rank == rank &&
        other.trumpValue == trumpValue &&
        other.isExcuse == isExcuse;
  }

  @override
  int get hashCode => Object.hash(type, suit, rank, trumpValue, isExcuse);
}

// ============================================
// DISTRIBUTE_CARDS.DART
// ============================================
import '../entities/game.dart';
import '../entities/card.dart';
import '../enums/suit.dart';
import '../enums/rank.dart';

class DistributeCards {
  /// Distribue les cartes ordinaires au début de la partie
  void distributeOrdinaryCards(Game game) {
    const suits = Suit.values;

    for (int i = 0; i < game.playersCount; i++) {
      final player = game.players[i];
      final suit = suits[i];

      // Créer et trier les cartes par ordre décroissant
      // As = 1 donc en dernière position
      player.ordinaryCards = Rank.values.reversed.map((rank) {
        return TarotCard.normal(suit: suit, rank: rank);
      }).toList();
    }
  }

  /// Distribue les cartes spéciales (atouts + excuse) pour un tour
  void distributeSpecialCards(Game game, int cardsPerPlayer) {
    final specialDeck = _createSpecialDeck();
    specialDeck.shuffle();

    int cardIndex = 0;
    for (var player in game.players) {
      player.specialCards =
          specialDeck.skip(cardIndex).take(cardsPerPlayer).toList();
      cardIndex += cardsPerPlayer;
    }
  }

  /// Crée le paquet de cartes spéciales (atouts 1-21 + excuse)
  List<TarotCard> _createSpecialDeck() {
    final List<TarotCard> deck = [];

    // Atouts 1 à 21
    for (int t = 1; t <= 21; t++) {
      deck.add(TarotCard.trump(trumpValue: t));
    }

    // Excuse
    deck.add(const TarotCard.excuse());

    return deck;
  }
}

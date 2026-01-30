// ============================================
// PLAY_CARD.DART
// ============================================
import '../entities/player.dart';
import '../entities/card.dart';
import '../entities/round.dart';

class PlayCard {
  bool call(Player player, TarotCard card, Round round) {
    // Vérifier que le joueur a la carte
    if (!player.hand.contains(card)) {
      return false;
    }

    // Retirer la carte de la main du joueur
    if (!player.playCard(card)) {
      return false;
    }

    // Ajouter au pli actuel
    round.currentTrick.addPlay(player.name, card);

    return true;
  }
}

// ============================================
// CALCULATE_TRICK_WINNER.DART
// ============================================
import '../entities/trick.dart';
import '../enums/card_type.dart';

class CalculateTrickWinner {
  String call(Trick trick) {
    if (trick.plays.isEmpty) {
      throw Exception("Aucune carte jouée dans ce pli");
    }

    // Règles :
    // 1. L'excuse ne gagne jamais
    // 2. L'atout le plus fort gagne
    // 3. Sinon, la carte la plus forte de la couleur d'entame gagne

    final leadCard = trick.plays.first.card;
    final leadSuit = leadCard.suit;

    TrickPlay? bestPlay;

    for (var play in trick.plays) {
      final card = play.card;

      // L'excuse ne gagne jamais
      if (card.isExcuse) continue;

      if (bestPlay == null) {
        bestPlay = play;
        continue;
      }

      // Atout vs Atout : le plus fort gagne
      if (card.type == CardType.trump && bestPlay.card.type == CardType.trump) {
        if (card.trumpValue! > bestPlay.card.trumpValue!) {
          bestPlay = play;
        }
      }
      // Atout vs Normal : l'atout gagne
      else if (card.type == CardType.trump &&
          bestPlay.card.type != CardType.trump) {
        bestPlay = play;
      }
      // Normal vs Atout : l'atout reste gagnant
      else if (card.type != CardType.trump &&
          bestPlay.card.type == CardType.trump) {
        // bestPlay reste inchangé
      }
      // Normal vs Normal : même couleur, le plus fort gagne
      else if (card.suit == leadSuit && bestPlay.card.suit == leadSuit) {
        if (card.rank!.index > bestPlay.card.rank!.index) {
          bestPlay = play;
        }
      }
      // Normal vs Normal : couleur différente de l'entame ne gagne pas
      else if (card.suit != leadSuit && bestPlay.card.suit == leadSuit) {
        // bestPlay reste inchangé
      }
      // Cas où bestPlay n'est pas de la couleur d'entame et card l'est
      else if (card.suit == leadSuit && bestPlay.card.suit != leadSuit) {
        bestPlay = play;
      }
    }

    return bestPlay?.playerName ?? trick.plays.first.playerName;
  }
}

// ============================================
// PLAYER.DART - Entité Joueur
// ============================================
import 'card.dart';

class Player {
  final String name;
  final bool isHuman;

  // Cartes ordinaires (pré-distribuées, face visible)
  List<TarotCard> ordinaryCards;

  // Cartes spéciales pour ce tour (atouts + excuse)
  List<TarotCard> specialCards;

  int? bid;
  int tricksWon = 0;
  int score = 10; // Système de vie par défaut

  Player({
    required this.name,
    this.isHuman = false,
    List<TarotCard>? ordinaryCards,
    List<TarotCard>? specialCards,
  })  : ordinaryCards = ordinaryCards ?? [],
        specialCards = specialCards ?? [];

  /// Main complète du joueur pour le tour actuel
  List<TarotCard> get hand => [...ordinaryCards, ...specialCards];

  /// Réinitialise pour un nouveau tour (garde les cartes ordinaires)
  void resetForNewRound() {
    bid = null;
    tricksWon = 0;
    specialCards.clear();
  }

  /// Réinitialise complètement pour une nouvelle manche
  void resetForNewGame() {
    ordinaryCards.clear();
    specialCards.clear();
    bid = null;
    tricksWon = 0;
  }

  /// Joue une carte de sa main
  bool playCard(TarotCard card) {
    if (ordinaryCards.remove(card)) return true;
    if (specialCards.remove(card)) return true;
    return false;
  }
}

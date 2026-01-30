// ============================================
// TRICK.DART - Entité Pli
// ============================================
import 'card.dart';

class TrickPlay {
  final String playerName;
  final TarotCard card;

  TrickPlay(this.playerName, this.card);
}

class Trick {
  final List<TrickPlay> plays = [];
  String? winnerName;

  void addPlay(String playerName, TarotCard card) {
    plays.add(TrickPlay(playerName, card));
  }

  bool isComplete(int totalPlayers) {
    return plays.length == totalPlayers;
  }

  TarotCard? get leadCard => plays.isEmpty ? null : plays.first.card;
}

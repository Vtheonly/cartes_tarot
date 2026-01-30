// ============================================
// START_GAME.DART
// ============================================
import '../entities/game.dart';
import '../entities/player.dart';

class StartGame {
  Game call(int playersCount, {int humanPlayers = 1}) {
    if (playersCount < 3 || playersCount > 4) {
      throw Exception("Le jeu se joue à 3 ou 4 joueurs");
    }

    final players = List.generate(
      playersCount,
      (i) => Player(
        name: i < humanPlayers ? "Vous" : "Robot ${i + 1}",
        isHuman: i < humanPlayers,
      ),
    );

    return Game(playersCount: playersCount, players: players);
  }
}

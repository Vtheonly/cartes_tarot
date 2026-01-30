/*import 'package:cartes_tarot/features/game/domain/entities/card.dart';
import 'package:cartes_tarot/features/game/domain/entities/trick.dart';
import 'package:cartes_tarot/features/game/domain/enums/rank.dart';
import 'package:cartes_tarot/features/game/domain/enums/suit.dart';
import 'package:cartes_tarot/features/game/domain/service/game_engine.dart';
import 'package:cartes_tarot/features/game/domain/usecases/calculate_trick_winner.dart';
import 'package:cartes_tarot/features/game/presentation/controller/game_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Game Initialization Tests', () {
    test('Should create game with 3 players', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      final game = controller.startGame(3);

      expect(game.players.length, 3);
      expect(game.playersCount, 3);
    });

    test('Should create game with 4 players', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      final game = controller.startGame(4);

      expect(game.players.length, 4);
      expect(game.playersCount, 4);
    });

    test('Should throw error for invalid player count', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      expect(() => controller.startGame(2), throwsException);
      expect(() => controller.startGame(5), throwsException);
    });

    test('Should identify human and robot players', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4, humanPlayers: 1);

      final humanCount = controller.players.where((p) => p.isHuman).length;
      final robotCount = controller.players.where((p) => !p.isHuman).length;

      expect(humanCount, 1);
      expect(robotCount, 3);
    });
  });

  group('Card Distribution Tests', () {
    test('Should distribute ordinary cards at game start', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);

      // Chaque joueur doit avoir 14 cartes ordinaires
      for (var player in controller.players) {
        expect(player.ordinaryCards.length, 14);
      }
    });

    test('Should distribute special cards for round', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(5);

      // Chaque joueur doit avoir 5 cartes spéciales
      for (var player in controller.players) {
        expect(player.specialCards.length, 5);
      }
    });

    test('Should have correct total cards in hand', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(3);

      // Main totale = 14 ordinaires + 3 spéciales = 17
      for (var player in controller.players) {
        expect(player.hand.length, 17);
      }
    });
  });

  group('Bidding Phase Tests', () {
    test('Should accept valid bid', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(5);

      final player = controller.players.first;
      final success = controller.placeBid(player, 2);

      expect(success, true);
      expect(player.bid, 2);
    });

    test('Should reject bid when sum equals card count', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(5);

      // Premiers joueurs annoncent 2, 2, 1
      controller.placeBid(controller.players[0], 2);
      controller.placeBid(controller.players[1], 2);
      controller.placeBid(controller.players[2], 1);

      // Le dernier joueur ne peut pas annoncer 0 (2+2+1+0 = 5)
      final lastPlayer = controller.players[3];
      final validBids = controller.getValidBidsForPlayer(lastPlayer);

      expect(validBids.contains(0), false);
      expect(validBids.contains(1), true);
      expect(validBids.contains(2), true);
    });

    test('Should return correct next bidder', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(5);

      // Premier à annoncer : joueur après le donneur
      final firstBidder = controller.nextBidder;
      expect(firstBidder, isNotNull);

      controller.placeBid(firstBidder!, 2);

      // Prochain à annoncer
      final secondBidder = controller.nextBidder;
      expect(secondBidder, isNotNull);
      expect(secondBidder, isNot(firstBidder));
    });

    test('Should complete bidding when all players bid', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);
      controller.startNewRound(5);

      expect(controller.areBidsComplete, false);

      // Tous annoncent
      controller.placeBid(controller.players[0], 2);
      controller.placeBid(controller.players[1], 1);
      controller.placeBid(controller.players[2], 1);
      controller.placeBid(controller.players[3], 2);

      expect(controller.areBidsComplete, true);
      expect(controller.nextBidder, isNull);
    });
  });

  group('Trick Winner Calculation Tests', () {
    late CalculateTrickWinner calculateWinner;

    setUp(() {
      calculateWinner = CalculateTrickWinner();
    });

    test('Highest trump wins', () {
      final trick = Trick();
      trick.addPlay('P1', const TarotCard.trump(trumpValue: 5));
      trick.addPlay('P2', const TarotCard.trump(trumpValue: 10));
      trick.addPlay('P3', const TarotCard.trump(trumpValue: 3));

      final winner = calculateWinner(trick);
      expect(winner, 'P2');
    });

    test('Trump beats normal card', () {
      final trick = Trick();
      trick.addPlay(
          'P1', const TarotCard.normal(suit: Suit.heart, rank: Rank.king));
      trick.addPlay('P2', const TarotCard.trump(trumpValue: 1));
      trick.addPlay(
          'P3', const TarotCard.normal(suit: Suit.heart, rank: Rank.ace));

      final winner = calculateWinner(trick);
      expect(winner, 'P2'); // Même le trump 1 bat les cartes normales
    });

    test('Excuse never wins', () {
      final trick = Trick();
      trick.addPlay('P1', const TarotCard.excuse());
      trick.addPlay(
          'P2', const TarotCard.normal(suit: Suit.club, rank: Rank.two));

      final winner = calculateWinner(trick);
      expect(winner, 'P2');
    });

    test('Highest card of lead suit wins when no trumps', () {
      final trick = Trick();
      trick.addPlay(
          'P1', const TarotCard.normal(suit: Suit.heart, rank: Rank.ten));
      trick.addPlay(
          'P2', const TarotCard.normal(suit: Suit.heart, rank: Rank.king));
      trick.addPlay(
          'P3', const TarotCard.normal(suit: Suit.spade, rank: Rank.ace));

      final winner = calculateWinner(trick);
      expect(winner, 'P2'); // Roi de cœur bat 10 de cœur
    });

    test('Off-suit card does not win', () {
      final trick = Trick();
      trick.addPlay(
          'P1', const TarotCard.normal(suit: Suit.heart, rank: Rank.three));
      trick.addPlay(
          'P2', const TarotCard.normal(suit: Suit.spade, rank: Rank.king));

      final winner = calculateWinner(trick);
      expect(winner, 'P1'); // Couleur d'entame gagne
    });
  });

  group('Game Flow Tests', () {
    test('Should play complete round', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);
      controller.startNewRound(2); // 2 cartes par joueur

      // Phase d'annonces
      for (var player in controller.players) {
        controller.placeBid(player, 1);
      }

      expect(controller.areBidsComplete, true);

      // Phase de jeu - Premier pli
      while (controller.nextPlayer != null &&
          !controller.currentTrick!.isComplete(3)) {
        final player = controller.nextPlayer!;
        final card = player.hand.first;
        controller.playCard(player, card);
      }

      // Premier pli terminé
      expect(controller.currentTrick!.isComplete(3), true);
      expect(controller.currentTrick!.winnerName, isNotNull);

      // Jouer le second pli
      while (controller.nextPlayer != null &&
          controller.players.first.hand.isNotEmpty) {
        final player = controller.nextPlayer!;
        final card = player.hand.first;
        controller.playCard(player, card);
      }

      // Tour terminé
      expect(controller.isRoundComplete, true);
    });

    test('Should update scores correctly', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);
      controller.startNewRound(2);

      // Tous annoncent 1 pli
      for (var player in controller.players) {
        controller.placeBid(player, 1);
      }

      final initialScores = controller.players.map((p) => p.score).toList();

      // Jouer tous les plis
      while (!controller.isRoundComplete) {
        final player = controller.nextPlayer!;
        final card = player.hand.first;
        controller.playCard(player, card);
      }

      // Au moins un joueur doit avoir perdu des points
      final finalScores = controller.players.map((p) => p.score).toList();
      expect(finalScores, isNot(equals(initialScores)));
    });

    test('Should detect game over when player reaches 0', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);
      controller.startNewRound(3);

      // Forcer un joueur à 1 point
      controller.players.first.score = 1;

      // Faire une annonce impossible
      controller.placeBid(controller.players.first, 3);

      for (int i = 1; i < controller.players.length; i++) {
        controller.placeBid(controller.players[i], 0);
      }

      // Jouer le tour (le joueur perdra des points)
      while (!controller.isRoundComplete) {
        final player = controller.nextPlayer!;
        final card = player.hand.first;
        controller.playCard(player, card);
      }

      expect(controller.isGameOver, true);
      expect(controller.winner, isNotNull);
    });

    test('Should rotate dealer after each round', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);

      final initialDealer = controller.currentDealer;

      // Jouer un tour complet
      controller.startNewRound(1);
      for (var player in controller.players) {
        controller.placeBid(player, 0);
      }
      while (!controller.isRoundComplete) {
        final player = controller.nextPlayer!;
        controller.playCard(player, player.hand.first);
      }

      // Démarrer le tour suivant
      controller.startNewRound(1);

      final newDealer = controller.currentDealer;
      expect(newDealer, isNot(initialDealer));
    });
  });

  group('Edge Cases Tests', () {
    test('Should handle all players announcing 0', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);
      controller.startNewRound(3);

      controller.placeBid(controller.players[0], 0);
      controller.placeBid(controller.players[1], 0);
      // Le dernier ne peut pas annoncer 3 (somme = 3)
      final validBids = controller.getValidBidsForPlayer(controller.players[2]);

      expect(validBids.contains(3), false);
    });

    test('Should handle empty hand after playing all cards', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);
      controller.startNewRound(1); // 1 carte seulement

      for (var player in controller.players) {
        controller.placeBid(player, 0);
      }

      // Jouer toutes les cartes
      while (!controller.isRoundComplete) {
        final player = controller.nextPlayer!;
        controller.playCard(player, player.hand.first);
      }

      // Toutes les mains doivent être vides (cartes spéciales)
      for (var player in controller.players) {
        expect(player.specialCards.isEmpty, true);
      }
    });

    test('Should calculate correct next turn number', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);

      expect(controller.getNextTurnNumber(), 5);

      controller.startNewRound(5);
      expect(controller.getNextTurnNumber(), 4);

      controller.startNewRound(4);
      expect(controller.getNextTurnNumber(), 3);

      controller.startNewRound(3);
      expect(controller.getNextTurnNumber(), 2);

      controller.startNewRound(2);
      expect(controller.getNextTurnNumber(), 1);

      controller.startNewRound(1);
      expect(controller.getNextTurnNumber(), 5); // Recommence
    });
  });

  group('Controller Getters Tests', () {
    test('Should return correct leaderboard', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(4);

      // Modifier les scores
      controller.players[0].score = 10;
      controller.players[1].score = 5;
      controller.players[2].score = 8;
      controller.players[3].score = 3;

      final leaderboard = controller.leaderboard;

      expect(leaderboard[0].score, 10);
      expect(leaderboard[1].score, 8);
      expect(leaderboard[2].score, 5);
      expect(leaderboard[3].score, 3);
    });

    test('Should return correct game state description', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      controller.startGame(3);

      // Avant de démarrer un tour
      expect(controller.getGameStateDescription(), contains('attente'));

      controller.startNewRound(5);

      // Pendant les annonces
      expect(controller.getGameStateDescription(), contains('Annonces'));

      // Après les annonces
      for (var player in controller.players) {
        controller.placeBid(player, 1);
      }

      expect(controller.getGameStateDescription(), contains('doit jouer'));
    });
  });
}

// ============================================
// TESTS D'INTÉGRATION
// ============================================

void integrationTests() {
  group('Full Game Integration Tests', () {
    test('Should play a complete game from start to finish', () {
      final engine = GameEngine();
      final controller = GameController(engine);

      // Démarrer la partie
      controller.startGame(3, humanPlayers: 1);

      // Jouer 5 tours (une manche complète)
      for (int turnNumber = 5; turnNumber >= 1; turnNumber--) {
        controller.startNewRound(turnNumber);

        // Phase d'annonces
        for (var player in controller.players) {
          final validBids = controller.getValidBidsForPlayer(player);
          controller.placeBid(player, validBids.first);
        }

        // Phase de jeu
        while (!controller.isRoundComplete) {
          final player = controller.nextPlayer!;
          controller.playCard(player, player.hand.first);
        }
      }

      // Vérifier que tous les joueurs ont des scores
      for (var player in controller.players) {
        expect(player.score, greaterThanOrEqualTo(0));
      }
    });
  });
}
*/
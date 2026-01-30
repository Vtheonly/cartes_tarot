// ============================================
// PLACE_BID.DART
// ============================================
import '../entities/player.dart';
import '../entities/game.dart';

class PlaceBid {
  /// Valide et place l'annonce d'un joueur
  bool call(Player player, int bid, Game game) {
    if (bid < 0) {
      throw Exception("L'annonce doit être >= 0");
    }

    final round = game.currentRound;
    if (round == null) {
      throw Exception("Aucun tour en cours");
    }

    final cardsPerPlayer = round.turnNumber;
    if (bid > cardsPerPlayer) {
      throw Exception("L'annonce ne peut pas dépasser $cardsPerPlayer");
    }

    // Vérifier la règle : la somme des annonces != nombre de cartes
    if (_isLastBidder(player, game)) {
      final totalBids = _calculateTotalBids(game) + bid;
      if (totalBids == cardsPerPlayer) {
        return false; // Annonce invalide pour le dernier joueur
      }
    }

    player.bid = bid;
    return true;
  }

  bool _isLastBidder(Player player, Game game) {
    final bidsPlaced = game.players.where((p) => p.bid != null).length;
    return bidsPlaced == game.playersCount - 1;
  }

  int _calculateTotalBids(Game game) {
    return game.players
        .where((p) => p.bid != null)
        .fold(0, (sum, p) => sum + p.bid!);
  }

  /// Retourne les annonces valides pour un joueur
  List<int> getValidBids(Player player, Game game) {
    final round = game.currentRound!;
    final cardsPerPlayer = round.turnNumber;
    final validBids = <int>[];

    for (int bid = 0; bid <= cardsPerPlayer; bid++) {
      if (_isLastBidder(player, game)) {
        final totalBids = _calculateTotalBids(game) + bid;
        if (totalBids != cardsPerPlayer) {
          validBids.add(bid);
        }
      } else {
        validBids.add(bid);
      }
    }

    return validBids;
  }
}

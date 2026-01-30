import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

void main() {
  runApp(const TarotAfricainApp());
}

class TarotAfricainApp extends StatelessWidget {
  const TarotAfricainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tarot Africain',
      theme: ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      home: const MainMenu(),
    );
  }
}

// --- MODELS ---
enum CardType { trump, excuse }

class TarotCard {
  final int value;
  final CardType type;
  TarotCard(this.value, this.type);

  String get label => type == CardType.excuse ? "Excuse" : "Atout $value";
}

// --- GAME CONTROLLER ---
class GameController extends GetxController {
  var playerCount = 4.obs;
  var scores = <int>[14, 14, 14, 14].obs; // Lives (King to Ace = 14)
  var currentCardsCount = 5.obs; // 5 -> 4 -> 3 -> 2 -> 1
  var dealerIndex = 0.obs;
  var currentPlayerIndex = 0.obs;
  
  var playerHands = <List<TarotCard>>[[], [], [], []].obs;
  var currentBids = <int?>[null, null, null, null].obs;
  var tricksWon = <int>[0, 0, 0, 0].obs;
  var tableCards = <int, TarotCard>{}.obs; // PlayerIndex : Card
  
  var isBiddingPhase = true.obs;
  var statusMessage = "Bienvenue! J2 commence les annonces.".obs;

  final List<TarotCard> deck = [
    ...List.generate(21, (i) => TarotCard(i + 1, CardType.trump)),
    TarotCard(0, CardType.excuse), // We'll treat Excuse as 0 or 22 logic
  ];

  void setupGame(int players) {
    playerCount.value = players;
    scores.value = List.generate(players, (_) => 14);
    startRound();
  }

  void startRound() {
    // Reset Round
    tableCards.clear();
    tricksWon.value = List.generate(playerCount.value, (_) => 0);
    currentBids.value = List.generate(playerCount.value, (_) => null);
    
    // Deal Cards
    var shuffledDeck = List<TarotCard>.from(deck)..shuffle();
    for (int i = 0; i < playerCount.value; i++) {
      playerHands[i] = shuffledDeck.sublist(0, currentCardsCount.value);
      shuffledDeck.removeRange(0, currentCardsCount.value);
    }
    
    isBiddingPhase.value = true;
    currentPlayerIndex.value = (dealerIndex.value + 1) % playerCount.value;
    updateStatus();
    
    // If AI starts bidding
    if (currentPlayerIndex.value != 0) aiBidLogic();
  }

  void updateStatus() {
    if (isBiddingPhase.value) {
      statusMessage.value = "Joueur ${currentPlayerIndex.value + 1} annonce...";
    } else {
      statusMessage.value = "Joueur ${currentPlayerIndex.value + 1} joue...";
    }
  }

  // --- BIDDING LOGIC ---
  void submitBid(int bid) {
    currentBids[currentPlayerIndex.value] = bid;
    nextTurn();
  }

  List<int> getValidBids() {
    List<int> possible = List.generate(currentCardsCount.value + 1, (i) => i);
    
    // Sum constraint for the last bidder
    int lastBidder = dealerIndex.value;
    if (currentPlayerIndex.value == lastBidder) {
      int sum = currentBids.where((b) => b != null).fold(0, (a, b) => a! + b!);
      int forbidden = currentCardsCount.value - sum;
      possible.removeWhere((b) => b == forbidden);
    }
    return possible;
  }

  // --- TURN LOGIC ---
  void playCard(TarotCard card) {
    if (isBiddingPhase.value) return;
    
    tableCards[currentPlayerIndex.value] = card;
    playerHands[currentPlayerIndex.value].remove(card);
    
    if (tableCards.length == playerCount.value) {
      resolveTrick();
    } else {
      nextTurn();
    }
  }

  void nextTurn() {
    currentPlayerIndex.value = (currentPlayerIndex.value + 1) % playerCount.value;
    
    if (isBiddingPhase.value && currentBids[dealerIndex.value] != null) {
      isBiddingPhase.value = false;
      // Person to the left of dealer starts the first trick
      currentPlayerIndex.value = (dealerIndex.value + 1) % playerCount.value;
    }
    
    updateStatus();
    if (currentPlayerIndex.value != 0) {
      Future.delayed(const Duration(seconds: 1), () => isBiddingPhase.value ? aiBidLogic() : aiPlayLogic());
    }
  }

  void resolveTrick() {
    // Basic evaluation (Excuse = 0 for simplicity here, can be 22)
    int winner = tableCards.entries.reduce((a, b) => a.value.value > b.value.value ? a : b).key;
    
    tricksWon[winner]++;
    tableCards.clear();
    currentPlayerIndex.value = winner; // Winner starts next trick
    
    if (playerHands[0].isEmpty) {
      endRound();
    } else {
      updateStatus();
      if (currentPlayerIndex.value != 0) aiPlayLogic();
    }
  }

  void endRound() {
    // Scoring
    for (int i = 0; i < playerCount.value; i++) {
      int diff = (currentBids[i]! - tricksWon[i]).abs();
      scores[i] -= diff;
    }
    
    if (scores.any((s) => s <= 0)) {
      Get.defaultDialog(title: "Partie Terminée", middleText: "Le jeu est fini!");
      return;
    }

    // Progression 5 -> 4 -> 3 -> 2 -> 1
    if (currentCardsCount.value > 1) {
      currentCardsCount.value--;
    } else {
      // End of Manche: change dealer and reset to 5
      currentCardsCount.value = 5;
      dealerIndex.value = (dealerIndex.value + 1) % playerCount.value;
    }
    
    Get.snackbar("Fin de tour", "Les scores ont été mis à jour.");
    startRound();
  }

  // --- AI LOGIC ---
  void aiBidLogic() {
    var valid = getValidBids();
    submitBid(valid[Random().nextInt(valid.length)]);
  }

  void aiPlayLogic() {
    var hand = playerHands[currentPlayerIndex.value];
    playCard(hand[Random().nextInt(hand.length)]);
  }
}

// --- UI COMPONENTS ---
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainValue.center,
          children: [
            const Text("Tarot Africain", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () => startGame(3), child: const Text("Jouer à 3")),
            ElevatedButton(onPressed: () => startGame(4), child: const Text("Jouer à 4")),
          ],
        ),
      ),
    );
  }

  void startGame(int p) {
    Get.put(GameController()).setupGame(p);
    Get.to(() => const GameBoard());
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<GameController>();
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Cartes: ${c.currentCardsCount} | Vie: ${c.scores[0]}"))),
      body: Column(
        children: [
          // Top & Side Players (Robots)
          Expanded(child: _buildRobotArea(c)),
          
          // Table Area
          Container(
            height: 200,
            color: Colors.black26,
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: c.tableCards.values.map((card) => _CardWidget(card: card)).toList(),
            )),
          ),
          
          // Player Area
          Obx(() => _buildPlayerArea(c)),
        ],
      ),
    );
  }

  Widget _buildRobotArea(GameController c) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(c.playerCount.value - 1, (index) {
        int i = index + 1;
        return Column(
          children: [
            Text("Robot $i"),
            Text("Vies: ${c.scores[i]}"),
            Text("Pari: ${c.currentBids[i] ?? '?'}"),
            Text("Plis: ${c.tricksWon[i]}"),
            const Icon(Icons.person, size: 50),
          ],
        );
      }),
    ));
  }

  Widget _buildPlayerArea(GameController c) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(c.statusMessage.value, style: const TextStyle(color: Colors.yellow)),
          if (c.isBiddingPhase.value && c.currentPlayerIndex.value == 0)
            Wrap(
              children: c.getValidBids().map((b) => ActionChip(
                label: Text("Parier $b"),
                onPressed: () => c.submitBid(b),
              )).toList(),
            ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: c.playerHands[0].map((card) => GestureDetector(
                onTap: () {
                  if (!c.isBiddingPhase.value && c.currentPlayerIndex.value == 0) c.playCard(card);
                },
                child: _CardWidget(
                  card: card, 
                  isHidden: c.currentCardsCount.value == 1 && c.isBiddingPhase.value
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final TarotCard card;
  final bool isHidden;
  const _CardWidget({required this.card, this.isHidden = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 60,
      height: 100,
      decoration: BoxDecoration(
        color: isHidden ? Colors.blueGrey : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: isHidden 
          ? const Icon(Icons.help_outline, color: Colors.white)
          : Text(card.label, 
              textAlign: TextAlign.center, 
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }
}
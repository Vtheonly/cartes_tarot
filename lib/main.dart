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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1a1a2e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF16213e),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0f3460),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const MainMenu(),
    );
  }
}






enum CardType { trump, excuse }


class TarotCard {
  final int value; 
  final CardType type;
  
  TarotCard(this.value, this.type);
  
  
  String get label => type == CardType.excuse ? "Excuse" : "Atout $value";
  
  
  
  int getEffectiveValue({bool excuseAsHighest = false}) {
    if (type == CardType.excuse) {
      return excuseAsHighest ? 22 : 0;
    }
    return value;
  }
  
  
  String get imagePath {
    if (type == CardType.excuse) {
      return 'image/cartes-tarot/CaJ-TaroTv1-Exc.png';
    }
    return 'image/cartes-tarot/CaJ-TaroTv1-${value}AT.png';
  }
  
  
  static String get backImagePath => 'image/cartes-tarot/CaJ-TaroTv1-Dos.png';
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarotCard && value == other.value && type == other.type;
  
  @override
  int get hashCode => value.hashCode ^ type.hashCode;
}






class GameController extends GetxController {
  
  var playerCount = 4.obs;
  
  
  
  var scores = <int>[14, 14, 14, 14].obs;
  var scoreCardNames = <String>['Roi', 'Dame', 'Cavalier', 'Valet', '10', '9', '8', '7', '6', '5', '4', '3', '2', 'As'].obs;
  
  
  var currentCardsCount = 5.obs; 
  var mancheNumber = 1.obs;
  var roundInManche = 1.obs; 
  var dealerIndex = 0.obs;
  var currentPlayerIndex = 0.obs;
  
  
  var playerHands = <List<TarotCard>>[[], [], [], []].obs;
  var currentBids = <int?>[null, null, null, null].obs;
  var tricksWon = <int>[0, 0, 0, 0].obs;
  var tableCards = <int, TarotCard>{}.obs; 
  var trickLeader = 0.obs; 
  
  
  var isBiddingPhase = true.obs;
  var isGameOver = false.obs;
  var statusMessage = "Bienvenue au Tarot Africain!".obs;
  
  
  final List<TarotCard> deck = [
    ...List.generate(21, (i) => TarotCard(i + 1, CardType.trump)),
    TarotCard(0, CardType.excuse),
  ];
  
  
  void setupGame(int players) {
    playerCount.value = players;
    scores.value = List.generate(players, (_) => 14);
    currentCardsCount.value = 5;
    mancheNumber.value = 1;
    roundInManche.value = 1;
    dealerIndex.value = 0;
    isGameOver.value = false;
    
    
    playerHands.value = List.generate(players, (_) => <TarotCard>[]);
    
    startRound();
  }
  
  
  void startRound() {
    
    tableCards.clear();
    tricksWon.value = List.generate(playerCount.value, (_) => 0);
    currentBids.value = List.generate(playerCount.value, (_) => null);
    
    
    final shuffledDeck = List<TarotCard>.from(deck)..shuffle(Random());
    for (int i = 0; i < playerCount.value; i++) {
      playerHands[i] = shuffledDeck.sublist(
        i * currentCardsCount.value,
        (i + 1) * currentCardsCount.value,
      );
    }
    playerHands.refresh();
    
    
    isBiddingPhase.value = true;
    
    currentPlayerIndex.value = (dealerIndex.value + 1) % playerCount.value;
    trickLeader.value = currentPlayerIndex.value;
    
    _updateStatus();
    
    
    if (currentPlayerIndex.value != 0) {
      _scheduleAIAction();
    }
  }
  
  
  void _updateStatus() {
    String playerName = currentPlayerIndex.value == 0 
        ? "Vous" 
        : "Robot ${currentPlayerIndex.value}";
    
    if (isBiddingPhase.value) {
      if (currentPlayerIndex.value == 0) {
        statusMessage.value = "C'est votre tour d'annoncer";
      } else {
        statusMessage.value = "$playerName annonce...";
      }
    } else {
      if (currentPlayerIndex.value == 0) {
        statusMessage.value = "C'est votre tour de jouer";
      } else {
        statusMessage.value = "$playerName joue...";
      }
    }
  }
  
  
  
  
  
  
  void submitBid(int bid) {
    currentBids[currentPlayerIndex.value] = bid;
    currentBids.refresh();
    _nextTurn();
  }
  
  
  
  List<int> getValidBids() {
    List<int> possible = List.generate(currentCardsCount.value + 1, (i) => i);
    
    
    if (currentPlayerIndex.value == dealerIndex.value) {
      int sum = currentBids.where((b) => b != null).fold(0, (a, b) => a + b!);
      int forbidden = currentCardsCount.value - sum;
      if (forbidden >= 0 && forbidden <= currentCardsCount.value) {
        possible.removeWhere((b) => b == forbidden);
      }
    }
    return possible;
  }
  
  
  
  
  
  
  void playCard(TarotCard card) {
    if (isBiddingPhase.value) return;
    if (currentPlayerIndex.value != 0 && currentPlayerIndex.value != currentPlayerIndex.value) return;
    
    tableCards[currentPlayerIndex.value] = card;
    playerHands[currentPlayerIndex.value] = 
        List.from(playerHands[currentPlayerIndex.value])..remove(card);
    playerHands.refresh();
    tableCards.refresh();
    
    
    if (tableCards.length == playerCount.value) {
      _resolveTrick();
    } else {
      _nextTurn();
    }
  }
  
  
  void _nextTurn() {
    currentPlayerIndex.value = (currentPlayerIndex.value + 1) % playerCount.value;
    
    
    if (isBiddingPhase.value && currentBids[dealerIndex.value] != null) {
      isBiddingPhase.value = false;
      
      currentPlayerIndex.value = (dealerIndex.value + 1) % playerCount.value;
      trickLeader.value = currentPlayerIndex.value;
    }
    
    _updateStatus();
    
    
    if (currentPlayerIndex.value != 0) {
      _scheduleAIAction();
    }
  }
  
  
  void _resolveTrick() {
    
    
    int winnerIndex = trickLeader.value;
    int highestValue = -1;
    
    for (var entry in tableCards.entries) {
      int effectiveValue = entry.value.getEffectiveValue(excuseAsHighest: false);
      if (effectiveValue > highestValue) {
        highestValue = effectiveValue;
        winnerIndex = entry.key;
      }
    }
    
    tricksWon[winnerIndex]++;
    tricksWon.refresh();
    
    
    Future.delayed(const Duration(milliseconds: 800), () {
      tableCards.clear();
      currentPlayerIndex.value = winnerIndex;
      trickLeader.value = winnerIndex;
      
      
      if (playerHands[0].isEmpty) {
        _endRound();
      } else {
        _updateStatus();
        if (currentPlayerIndex.value != 0) {
          _scheduleAIAction();
        }
      }
    });
  }
  
  
  void _endRound() {
    
    List<String> results = [];
    for (int i = 0; i < playerCount.value; i++) {
      int bid = currentBids[i] ?? 0;
      int won = tricksWon[i];
      int diff = (bid - won).abs();
      
      if (diff > 0) {
        scores[i] -= diff;
        String name = i == 0 ? "Vous" : "Robot $i";
        results.add("$name: -$diff");
      }
    }
    scores.refresh();
    
    
    if (scores.any((s) => s <= 0)) {
      isGameOver.value = true;
      int winner = scores.indexWhere((s) => s == scores.reduce(max));
      String winnerName = winner == 0 ? "Vous avez" : "Robot $winner a";
      
      Get.dialog(
        AlertDialog(
          backgroundColor: const Color(0xFF16213e),
          title: const Text("🎉 Partie Terminée!", 
              style: TextStyle(color: Colors.amber)),
          content: Text("$winnerName gagné!\n\n${results.join('\n')}",
              style: const TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text("Menu Principal"),
            ),
          ],
        ),
        barrierDismissible: false,
      );
      return;
    }
    
    
    if (currentCardsCount.value > 1) {
      
      currentCardsCount.value--;
      roundInManche.value++;
    } else {
      
      currentCardsCount.value = 5;
      roundInManche.value = 1;
      mancheNumber.value++;
      dealerIndex.value = (dealerIndex.value + 1) % playerCount.value;
    }
    
    
    String message = results.isEmpty 
        ? "Tout le monde a rempli son contrat!" 
        : results.join(' | ');
    
    Get.snackbar(
      "Fin du tour",
      message,
      backgroundColor: const Color(0xFF0f3460),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
    
    
    Future.delayed(const Duration(seconds: 2), startRound);
  }
  
  
  
  
  
  void _scheduleAIAction() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (isBiddingPhase.value) {
        _aiBid();
      } else {
        _aiPlay();
      }
    });
  }
  
  
  void _aiBid() {
    var validBids = getValidBids();
    var hand = playerHands[currentPlayerIndex.value];
    
    
    int highCards = hand.where((c) => c.getEffectiveValue() >= 15).length;
    
    
    int targetBid = highCards.clamp(0, currentCardsCount.value);
    
    
    if (!validBids.contains(targetBid)) {
      targetBid = validBids[Random().nextInt(validBids.length)];
    }
    
    submitBid(targetBid);
  }
  
  
  void _aiPlay() {
    var hand = playerHands[currentPlayerIndex.value];
    if (hand.isEmpty) return;
    
    TarotCard cardToPlay;
    
    
    if (tableCards.isEmpty) {
      
      hand.sort((a, b) => a.getEffectiveValue().compareTo(b.getEffectiveValue()));
      cardToPlay = hand[hand.length ~/ 2];
    } else {
      
      int needed = (currentBids[currentPlayerIndex.value] ?? 0) - tricksWon[currentPlayerIndex.value];
      int highestOnTable = tableCards.values
          .map((c) => c.getEffectiveValue())
          .reduce(max);
      
      if (needed > 0) {
        
        var winners = hand.where((c) => c.getEffectiveValue() > highestOnTable).toList();
        if (winners.isNotEmpty) {
          winners.sort((a, b) => a.getEffectiveValue().compareTo(b.getEffectiveValue()));
          cardToPlay = winners.first;
        } else {
          
          hand.sort((a, b) => a.getEffectiveValue().compareTo(b.getEffectiveValue()));
          cardToPlay = hand.first;
        }
      } else {
        
        var losers = hand.where((c) => c.getEffectiveValue() < highestOnTable).toList();
        if (losers.isNotEmpty) {
          losers.sort((a, b) => b.getEffectiveValue().compareTo(a.getEffectiveValue()));
          cardToPlay = losers.first;
        } else {
          
          hand.sort((a, b) => b.getEffectiveValue().compareTo(a.getEffectiveValue()));
          cardToPlay = hand.first;
        }
      }
    }
    
    playCard(cardToPlay);
  }
}






class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e), Color(0xFF0f3460)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Text(
                  "🃏 Tarot Africain 🃏",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    shadows: [
                      Shadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Le jeu de plis stratégique",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 60),
                
                
                SizedBox(
                  height: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: -0.2,
                        child: _buildPreviewCard(-30),
                      ),
                      Transform.rotate(
                        angle: 0,
                        child: _buildPreviewCard(0),
                      ),
                      Transform.rotate(
                        angle: 0.2,
                        child: _buildPreviewCard(30),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                
                
                ElevatedButton.icon(
                  onPressed: () => _startGame(3),
                  icon: const Icon(Icons.people),
                  label: const Text("Jouer à 3 joueurs", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 56),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _startGame(4),
                  icon: const Icon(Icons.groups),
                  label: const Text("Jouer à 4 joueurs", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 56),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "📜 Annoncez vos plis, jouez vos cartes, "
                    "et réalisez exactement votre contrat!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildPreviewCard(double offset) {
    return Transform.translate(
      offset: Offset(offset, 0),
      child: Container(
        width: 80,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(77),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            TarotCard.backImagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.style, size: 40, color: Colors.deepPurple),
            ),
          ),
        ),
      ),
    );
  }
  
  void _startGame(int playerCount) {
    final controller = Get.put(GameController());
    controller.setupGame(playerCount);
    Get.to(() => const GameBoard());
  }
}


class GameBoard extends StatelessWidget {
  const GameBoard({super.key});
  
  @override
  Widget build(BuildContext context) {
    final c = Get.find<GameController>();
    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          "Manche ${c.mancheNumber} | Tour ${c.roundInManche}/5 | ${c.currentCardsCount} cartes",
          style: const TextStyle(fontSize: 14),
        )),
        actions: [
          
          Obx(() => TextButton.icon(
            onPressed: () => _showScoreBoard(c),
            icon: const Icon(Icons.emoji_events, color: Colors.amber),
            label: Text(
              "Vie: ${c.scores[0]}",
              style: const TextStyle(color: Colors.white),
            ),
          )),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: Column(
          children: [
            
            Expanded(
              flex: 2,
              child: Obx(() => _buildOpponentsArea(c)),
            ),
            
            
            Expanded(
              flex: 3,
              child: _buildTableArea(c),
            ),
            
            
            Obx(() => _buildPlayerArea(c)),
          ],
        ),
      ),
    );
  }
  
  
  void _showScoreBoard(GameController c) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF16213e),
        title: const Text("📊 Tableau des Scores", 
            style: TextStyle(color: Colors.amber)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(c.playerCount.value, (i) {
            String name = i == 0 ? "Vous" : "Robot $i";
            int lives = c.scores[i];
            String cardName = lives > 0 && lives <= 14 
                ? c.scoreCardNames[14 - lives] 
                : lives <= 0 ? "Éliminé" : "Roi+";
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(color: Colors.white)),
                  Text("$lives ($cardName)", 
                      style: TextStyle(
                        color: lives <= 3 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Fermer"),
          ),
        ],
      ),
    );
  }
  
  
  Widget _buildOpponentsArea(GameController c) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(c.playerCount.value - 1, (index) {
          int playerIdx = index + 1;
          bool isCurrentTurn = c.currentPlayerIndex.value == playerIdx;
          
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCurrentTurn 
                  ? Colors.amber.withAlpha(51) 
                  : Colors.white.withAlpha(13),
              borderRadius: BorderRadius.circular(12),
              border: isCurrentTurn 
                  ? Border.all(color: Colors.amber, width: 2)
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                CircleAvatar(
                  backgroundColor: const Color(0xFF0f3460),
                  child: Text("R$playerIdx", 
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(height: 4),
                
                Text("❤️ ${c.scores[playerIdx]}", 
                    style: const TextStyle(color: Colors.red, fontSize: 12)),
                
                if (c.currentBids[playerIdx] != null)
                  Text("🎯 ${c.currentBids[playerIdx]}", 
                      style: const TextStyle(color: Colors.amber, fontSize: 12)),
                
                Text("🏆 ${c.tricksWon[playerIdx]}", 
                    style: const TextStyle(color: Colors.green, fontSize: 12)),
                
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    c.playerHands[playerIdx].length.clamp(0, 5),
                    (_) => Container(
                      width: 12,
                      height: 18,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
  
  
  Widget _buildTableArea(GameController c) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1a5f3c), 
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0xFF8b4513), width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(128),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Obx(() {
          if (c.tableCards.isEmpty) {
            return Text(
              c.isBiddingPhase.value 
                  ? "Phase d'annonces" 
                  : "Table vide",
              style: const TextStyle(color: Colors.white54, fontSize: 16),
            );
          }
          
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: c.tableCards.entries.map((entry) {
              String playerLabel = entry.key == 0 ? "Vous" : "R${entry.key}";
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TarotCardWidget(
                    card: entry.value,
                    width: 60,
                    height: 90,
                  ),
                  const SizedBox(height: 4),
                  Text(playerLabel, 
                      style: const TextStyle(color: Colors.white70, fontSize: 10)),
                ],
              );
            }).toList(),
          );
        }),
      ),
    );
  }
  
  
  Widget _buildPlayerArea(GameController c) {
    bool isPlayerTurn = c.currentPlayerIndex.value == 0;
    bool isHiddenRound = c.currentCardsCount.value == 1 && c.isBiddingPhase.value;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(77),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isPlayerTurn ? Colors.amber.withAlpha(51) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              c.statusMessage.value,
              style: TextStyle(
                color: isPlayerTurn ? Colors.amber : Colors.white70,
                fontSize: 16,
                fontWeight: isPlayerTurn ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("❤️ ${c.scores[0]}", 
                  style: const TextStyle(color: Colors.red)),
              const SizedBox(width: 16),
              if (c.currentBids[0] != null)
                Text("🎯 Annonce: ${c.currentBids[0]}", 
                    style: const TextStyle(color: Colors.amber)),
              const SizedBox(width: 16),
              Text("🏆 Plis: ${c.tricksWon[0]}", 
                  style: const TextStyle(color: Colors.green)),
            ],
          ),
          const SizedBox(height: 12),
          
          
          if (c.isBiddingPhase.value && isPlayerTurn)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: c.getValidBids().map((bid) => ElevatedButton(
                onPressed: () => c.submitBid(bid),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0f3460),
                  minimumSize: const Size(56, 40),
                ),
                child: Text("$bid"),
              )).toList(),
            ),
          
          const SizedBox(height: 12),
          
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: c.playerHands[0].map((card) {
                bool canPlay = !c.isBiddingPhase.value && isPlayerTurn;
                
                return GestureDetector(
                  onTap: canPlay ? () => c.playCard(card) : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.identity()
                      ..translate(0.0, canPlay ? -8.0 : 0.0),
                    child: TarotCardWidget(
                      card: card,
                      isHidden: isHiddenRound,
                      isInteractive: canPlay,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}


class TarotCardWidget extends StatelessWidget {
  final TarotCard card;
  final bool isHidden;
  final bool isInteractive;
  final double width;
  final double height;
  
  const TarotCardWidget({
    super.key,
    required this.card,
    this.isHidden = false,
    this.isInteractive = false,
    this.width = 70,
    this.height = 105,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: isInteractive 
                ? Colors.amber.withAlpha(128) 
                : Colors.black.withAlpha(77),
            blurRadius: isInteractive ? 12 : 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          isHidden ? TarotCard.backImagePath : card.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            
            return Container(
              color: isHidden ? const Color(0xFF3a3a5c) : Colors.white,
              child: Center(
                child: isHidden
                    ? const Icon(Icons.help_outline, color: Colors.white54, size: 30)
                    : Text(
                        card.label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
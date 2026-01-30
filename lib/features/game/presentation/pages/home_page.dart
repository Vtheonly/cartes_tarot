import 'package:flutter/material.dart';
import '../../domain/service/game_engine.dart';
import '../controller/game_controller.dart';
import 'game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarot Africain'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Title
                Icon(
                  Icons.style,
                  size: 80,
                  color: Colors.blue.shade700,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tarot Africain',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Jeu de plis et de paris',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 60),

                // Player Selection Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Text(
                          'Choisissez le nombre de joueurs',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // 3 Players Button
                        _PlayerCountButton(
                          playerCount: 3,
                          onPressed: () => _startGame(context, 3),
                        ),
                        const SizedBox(height: 12),

                        // 4 Players Button
                        _PlayerCountButton(
                          playerCount: 4,
                          onPressed: () => _startGame(context, 4),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Rules Button
                OutlinedButton.icon(
                  onPressed: () => _showRulesDialog(context),
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Règles du jeu'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startGame(BuildContext context, int playersCount) {
    try {
      final engine = GameEngine();
      final controller = GameController(engine);

      // Démarrer la partie avec 1 joueur humain
      controller.startGame(playersCount, humanPlayers: 1);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GamePage(controller: controller),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur : $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Règles du Tarot Africain'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Objectif',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Réaliser exactement le nombre de plis que vous avez annoncé.',
              ),
              SizedBox(height: 16),
              Text(
                'Déroulement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Chaque joueur reçoit des cartes (5→4→3→2→1)\n'
                '2. Annoncez le nombre de plis que vous comptez faire\n'
                '3. La somme des annonces ne peut pas égaler le nombre de cartes\n'
                '4. Jouez vos cartes pour tenter de réaliser votre objectif',
              ),
              SizedBox(height: 16),
              Text(
                'Scoring',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '• Réussite : pas de perte de points\n'
                '• Échec : perdez autant de points que la différence\n'
                '• La partie se termine quand un joueur atteint 0 points\n'
                '• Le gagnant est celui qui a le plus de points',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Compris !'),
          ),
        ],
      ),
    );
  }
}

class _PlayerCountButton extends StatelessWidget {
  final int playerCount;
  final VoidCallback onPressed;

  const _PlayerCountButton({
    required this.playerCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.blue.shade600,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.group,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              '$playerCount Joueurs',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          PremiumCard(child: ListTile(title: Text('Conversation Colloquy'), subtitle: Text('Role-play pastoral dialogue'))),
          SizedBox(height: 12),
          PremiumCard(child: ListTile(title: Text('Apologetic Disputation'), subtitle: Text('Answer difficult objections'))),
          SizedBox(height: 12),
          PremiumCard(child: ListTile(title: Text('Pastoral Feedback Atelier'), subtitle: Text('Reflect and refine delivery'))),
        ],
      ),
    );
  }
}

import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: const [
          SectionHeader(title: 'Practice Studio', subtitle: 'Polished drills for confident real-world dialogue.'),
          SizedBox(height: 12),
          PremiumCard(child: ListTile(leading: Icon(Icons.chat_bubble_rounded), title: Text('Conversation Colloquy'), subtitle: Text('Role-play pastoral dialogue'))),
          SizedBox(height: 12),
          PremiumCard(child: ListTile(leading: Icon(Icons.gavel_rounded), title: Text('Apologetic Disputation'), subtitle: Text('Answer difficult objections'))),
          SizedBox(height: 12),
          PremiumCard(child: ListTile(leading: Icon(Icons.rate_review_rounded), title: Text('Pastoral Feedback Atelier'), subtitle: Text('Reflect and refine delivery'))),
        ],
      ),
    );
  }
}

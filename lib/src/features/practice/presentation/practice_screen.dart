import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SectionHeader(title: 'Practice'),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlaceholderDetailScreen(title: 'Conversation Simulator'))),
              child: const Text('Conversation Simulator'),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlaceholderDetailScreen(title: 'Apologetics Sparring'))),
              child: const Text('Apologetics Sparring'),
            ),
            const SizedBox(height: 12),
            const PremiumCard(child: Text('Feedback Coach (Placeholder)')),
            const SizedBox(height: 12),
            const PremiumCard(child: Text('Saved Sessions (Placeholder)')),
          ],
        ),
      ),
    );
  }
}

class PlaceholderDetailScreen extends StatelessWidget {
  const PlaceholderDetailScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Placeholder Screen')),
    );
  }
}

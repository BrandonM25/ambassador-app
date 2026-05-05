import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        child: ListView(
          children: [
            const SectionHeader(title: 'Oratory Praxis', subtitle: 'Refine pastoral tone, doctrinal precision, and conversational poise.'),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlaceholderDetailScreen(title: 'Conversation Colloquy'))),
              child: const Text('Conversation Colloquy'),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlaceholderDetailScreen(title: 'Apologetic Disputation'))),
              child: const Text('Apologetic Disputation'),
            ),
            const SizedBox(height: 12),
            const PremiumCard(child: Text('Pastoral Feedback Atelier (Placeholder)')),
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
    return Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text('$title Placeholder Screen')));
  }
}

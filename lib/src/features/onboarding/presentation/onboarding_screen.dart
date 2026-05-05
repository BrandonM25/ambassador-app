import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(height: 210, decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), gradient: LinearGradient(colors: [cs.surfaceContainerHighest, cs.surface])), child: const Center(child: Icon(Icons.shield_moon_rounded, size: 80))),
            const SizedBox(height: 18),
            Text('Welcome to Ambassador', style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('A calmer, glanceable formation experience with modular pathways for daily rhythm.', style: text.bodyLarge),
            const SizedBox(height: 14),
            const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Learn')), Chip(label: Text('Practice')), Chip(label: Text('Track Growth'))]),
            const SizedBox(height: 14),
            const PremiumCard(child: ListTile(leading: Icon(Icons.grid_view_rounded), title: Text('Modular dashboard tiles'))),
            const SizedBox(height: 10),
            const PremiumCard(child: ListTile(leading: Icon(Icons.animation_rounded), title: Text('Expressive motion + tactile surfaces'))),
            const SizedBox(height: 10),
            const PremiumCard(child: ListTile(leading: Icon(Icons.palette_outlined), title: Text('Warm light mode + graphite dark mode'))),
            const SizedBox(height: 18),
            FilledButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AppScaffold())), child: const Text('Enter Dashboard')),
          ],
        ),
      ),
    );
  }
}

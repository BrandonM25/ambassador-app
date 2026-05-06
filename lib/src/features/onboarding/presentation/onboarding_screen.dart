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
            Container(
              height: 280,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [cs.surfaceContainerHighest.withValues(alpha: .86), cs.surface.withValues(alpha: .7)])),
              child: Center(
                child: Image.asset(
                  'assets/branding/ambassador_crest.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Flagship formation, redesigned.', style: text.headlineMedium),
            const SizedBox(height: 10),
            Text('A premium, modular rhythm for learning, practice, and growth.', style: text.bodyLarge),
            const SizedBox(height: 18),
            const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Expressive Motion')), Chip(label: Text('Tonal Surfaces')), Chip(label: Text('Focused Flow'))]),
            const SizedBox(height: 16),
            const PremiumCard(child: ListTile(leading: Icon(Icons.dashboard_customize_rounded), title: Text('Asymmetric modular dashboard'))),
            const SizedBox(height: 12),
            const PremiumCard(child: ListTile(leading: Icon(Icons.blur_on_rounded), title: Text('Atmospheric depth and glass layers'))),
            const SizedBox(height: 24),
            FilledButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AppScaffold())), child: const Text('Enter Ambassador')),
          ],
        ),
      ),
    );
  }
}

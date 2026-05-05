import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Ambassador', style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('Train with clarity, practice with confidence.', style: text.bodyLarge),
            const SizedBox(height: 18),
            const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Doctrine')), Chip(label: Text('Practice')), Chip(label: Text('Daily Rhythm'))]),
            const SizedBox(height: 18),
            const Expanded(
              child: Column(children: [
                PremiumCard(child: ListTile(leading: Icon(Icons.layers_rounded), title: Text('Modular daily dashboard'))),
                SizedBox(height: 12),
                PremiumCard(child: ListTile(leading: Icon(Icons.bolt_rounded), title: Text('Glanceable progress hierarchy'))),
                SizedBox(height: 12),
                PremiumCard(child: ListTile(leading: Icon(Icons.motion_photos_auto_rounded), title: Text('Expressive Material motion'))),
              ]),
            ),
            FilledButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AppScaffold())), child: const Text('Get started')),
          ]),
        ),
      ),
    );
  }
}

import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return SafeArea(
      child: ListView(padding: const EdgeInsets.all(20), children: [
        PremiumCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Today', style: text.labelLarge),
            const SizedBox(height: 8),
            Text('Formation Dashboard', style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('Three focused modules. Continue where you left off.', style: text.bodyMedium),
            const SizedBox(height: 16),
            const Wrap(spacing: 8, children: [Chip(label: Text('Scripture')), Chip(label: Text('Doctrine')), Chip(label: Text('Dialogue'))]),
          ]),
        ),
        const SizedBox(height: 12),
        const PremiumCard(child: ListTile(leading: Icon(Icons.play_circle_fill_rounded), title: Text('Gospel in 90 seconds'), subtitle: Text('7 min'))),
        const SizedBox(height: 12),
        const PremiumCard(child: ListTile(leading: Icon(Icons.forum_rounded), title: Text('Guided conversation drill'), subtitle: Text('Practice tone + clarity'))),
      ]),
    );
  }
}

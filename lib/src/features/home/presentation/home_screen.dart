import 'package:ambassador_app/src/core/widgets/crest_logo.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(children: [const CrestLogo(size: 38), const SizedBox(width: 12), Text('Ambassador', style: text.titleLarge)]),
          const SizedBox(height: 12),
          const SectionHeader(title: 'Today', subtitle: 'Your flagship daily formation cockpit.'),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Formation Dashboard', style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('Three modules curated for today.', style: text.bodyMedium),
              const SizedBox(height: 16),
              const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Scripture')), Chip(label: Text('Doctrine')), Chip(label: Text('Dialogue'))]),
            ]),
          ),
          const SizedBox(height: 12),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: _MetricTile(label: 'Streak', value: '12d', icon: Icons.local_fire_department_rounded, color: cs.primary)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(children: [
                _MetricTile(label: 'Completion', value: '68%', icon: Icons.auto_graph_rounded, color: cs.secondary),
                const SizedBox(height: 12),
                const PremiumCard(child: ListTile(dense: true, leading: Icon(Icons.bolt_rounded), title: Text('Quick Sprint'))),
              ]),
            ),
          ]),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value, required this.icon, required this.color});
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: color), const SizedBox(height: 10), Text(value, style: Theme.of(context).textTheme.headlineSmall), Text(label)]));
  }
}

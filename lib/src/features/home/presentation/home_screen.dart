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
          const SectionHeader(title: 'Today', subtitle: 'Your next best step in one glance.'),
          const SizedBox(height: 12),
          PremiumCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Formation Dashboard', style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('Continue your learning flow with three focused modules.', style: text.bodyMedium),
              const SizedBox(height: 14),
              const Wrap(spacing: 8, runSpacing: 8, children: [Chip(label: Text('Scripture')), Chip(label: Text('Doctrine')), Chip(label: Text('Dialogue'))]),
            ]),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _MetricTile(label: 'Streak', value: '12d', icon: Icons.local_fire_department_rounded, color: cs.primary)),
            const SizedBox(width: 12),
            Expanded(child: _MetricTile(label: 'Completed', value: '68%', icon: Icons.auto_graph_rounded, color: cs.secondary)),
          ]),
          const SizedBox(height: 12),
          const PremiumCard(child: ListTile(leading: Icon(Icons.play_circle_fill_rounded), title: Text('Gospel in 90 seconds'), subtitle: Text('7 min • Continue'))),
          const SizedBox(height: 12),
          const PremiumCard(child: ListTile(leading: Icon(Icons.record_voice_over_rounded), title: Text('Guided response rehearsal'), subtitle: Text('Practice tone, pacing, clarity'))),
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
    return PremiumCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: color), const SizedBox(height: 8), Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)), Text(label)]),
    );
  }
}

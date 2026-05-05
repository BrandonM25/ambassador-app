import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
      if (subtitle != null) ...[const SizedBox(height: 6), Text(subtitle!, style: text.bodyMedium)],
    ]);
  }
}

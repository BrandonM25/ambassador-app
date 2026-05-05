import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:ambassador_app/src/features/doctrine/presentation/doctrine_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        children: [
          const SectionHeader(title: 'Your Formation', subtitle: 'Steward your studies, convictions, and academy commitments.'),
          const SizedBox(height: 12),
          PremiumCard(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Doctrine Constitution'),
              subtitle: const Text('Concise institutional confession'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DoctrineScreen())),
            ),
          ),
        ],
      ),
    );
  }
}

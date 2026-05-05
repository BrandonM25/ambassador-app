import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spaceLg),
              decoration: BoxDecoration(
                gradient: AppColors.heroGradient,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: AppColors.glass),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Ambassador', style: Theme.of(context).textTheme.bodyMedium?.copyWith(letterSpacing: 1.1, color: AppColors.softGold)),
                const SizedBox(height: AppTheme.spaceSm),
                Text('Train to proclaim Christ clearly and graciously.', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: AppTheme.spaceMd),
                Text('Focused formation in discipleship, evangelism, and apologetics with thoughtful guided practice.', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: AppTheme.spaceLg),
                DecoratedBox(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.2), blurRadius: 20)]),
                  child: FilledButton(onPressed: () {}, child: const Text('Continue Formation')),
                ),
              ]),
            ),
            const SizedBox(height: AppTheme.spaceLg),
            const SectionHeader(title: 'Today', subtitle: 'Curated next steps for a steady cadence.'),
            const SizedBox(height: AppTheme.spaceMd),
            const PremiumCard(child: Text('Review: The Gospel in 90 seconds')),
            const SizedBox(height: AppTheme.spaceMd),
            const PremiumCard(child: Text('Practice Prompt: Respond with gentleness and clarity')),
          ],
        ),
      ),
    );
  }
}

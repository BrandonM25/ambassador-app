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
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.35), blurRadius: 34, spreadRadius: -10, offset: const Offset(0, 18))],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('AMBASSADOR ACADEMY', style: Theme.of(context).textTheme.bodyMedium?.copyWith(letterSpacing: 1.8, color: AppColors.champagneGold)),
                const SizedBox(height: AppTheme.spaceSm),
                Text('Formed in truth.\nCommissioned with grace.', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: AppTheme.spaceMd),
                Text('Daily theological training through Scripture study, doctrinal depth, and pastoral communication drills.', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: AppTheme.spaceLg),
                FilledButton(onPressed: () {}, child: const Text('Continue Formation')),
              ]),
            ),
            const SizedBox(height: AppTheme.spaceLg),
            const SectionHeader(title: 'Today\'s Rule of Study', subtitle: 'Curated disciplines for consistent growth.'),
            const SizedBox(height: AppTheme.spaceMd),
            const PremiumCard(child: Text('Lecture: The Gospel in 90 Seconds')),
            const SizedBox(height: AppTheme.spaceMd),
            const PremiumCard(child: Text('Dialogue Drill: Speak with Conviction & Charity')),
          ],
        ),
      ),
    );
  }
}

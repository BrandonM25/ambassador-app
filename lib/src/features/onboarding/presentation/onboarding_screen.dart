import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cards = [
      ('Doctrine & Formation', Icons.auto_stories_outlined),
      ('Guided Dialogue Practice', Icons.forum_outlined),
      ('Confessional Clarity', Icons.shield_outlined),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Welcome to Ambassador Academy',
                subtitle: 'A premium theological formation experience with timeless guidance and practical discipline.',
              ),
              const SizedBox(height: AppTheme.spaceLg),
              Expanded(
                child: ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => const SizedBox(height: AppTheme.spaceMd),
                  itemBuilder: (context, i) => PremiumCard(
                    child: Row(
                      children: [
                        Icon(cards[i].$2, color: AppColors.champagneGold),
                        const SizedBox(width: 12),
                        Expanded(child: Text(cards[i].$1, style: Theme.of(context).textTheme.titleMedium)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  gradient: const LinearGradient(colors: [AppColors.champagneGold, AppColors.bronzeAccent]),
                ),
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AppScaffold())),
                  style: FilledButton.styleFrom(backgroundColor: AppColors.champagneGold, foregroundColor: AppColors.graphiteBlack),
                  child: const Text('Enter the Academy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

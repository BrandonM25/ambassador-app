import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cards = [
      ('Learn Truth', Icons.auto_stories_outlined),
      ('Practice Conversations', Icons.chat_bubble_outline),
      ('Defend the Faith', Icons.shield_outlined),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Welcome to Ambassador', subtitle: 'A Scripture-first training platform for faithful witness.'),
              const SizedBox(height: AppTheme.spaceLg),
              Expanded(
                child: ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => const SizedBox(height: AppTheme.spaceMd),
                  itemBuilder: (context, i) => TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 460 + (i * 140)),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, (1 - value) * 12), child: child)),
                    child: PremiumCard(
                      child: Row(children: [Icon(cards[i].$2, color: Theme.of(context).colorScheme.secondary), const SizedBox(width: 12), Text(cards[i].$1, style: Theme.of(context).textTheme.titleLarge)]),
                    ),
                  ),
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const AppScaffold(),
                  transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
                )),
                child: const Text('Begin Training'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

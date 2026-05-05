import 'package:ambassador_app/src/app/ambassador_app.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cards = ['Learn Truth', 'Practice Conversations', 'Defend the Faith'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Welcome to Ambassador', subtitle: 'A Scripture-first training platform.'),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) => TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 450 + (i * 120)),
                    builder: (context, value, child) => Opacity(
                      opacity: value,
                      child: Transform.translate(offset: Offset(0, (1 - value) * 16), child: child),
                    ),
                    child: PremiumCard(child: Text(cards[i], style: Theme.of(context).textTheme.titleLarge)),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const AppScaffold()),
                  ),
                  child: const Text('Begin Training'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

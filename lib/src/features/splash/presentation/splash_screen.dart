import 'dart:async';

import 'package:ambassador_app/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300))..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1800), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: RadialGradient(colors: [cs.surfaceContainerHighest.withValues(alpha: .5), Theme.of(context).scaffoldBackgroundColor], radius: 1.2)),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Container(
              width: 148,
              height: 148,
              decoration: BoxDecoration(color: cs.surface, borderRadius: BorderRadius.circular(42), boxShadow: [BoxShadow(color: cs.primary.withValues(alpha: .35), blurRadius: 32)]),
              child: Icon(Icons.shield_rounded, color: cs.primary, size: 56 + (_controller.value * 8)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

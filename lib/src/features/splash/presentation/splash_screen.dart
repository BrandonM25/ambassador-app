import 'dart:async';

import 'package:ambassador_app/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);
    Timer(const Duration(milliseconds: 2100), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(44),
              boxShadow: [BoxShadow(color: cs.primary.withValues(alpha: .3), blurRadius: 32, spreadRadius: -10)],
            ),
            child: Icon(Icons.shield_moon_rounded, color: cs.primary, size: 58 + (_controller.value * 5)),
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

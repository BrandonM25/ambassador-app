import 'dart:async';

import 'package:ambassador_app/src/core/widgets/crest_logo.dart';
import 'package:ambassador_app/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2100), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(center: const Alignment(-.45, -.7), radius: 1.4, colors: [cs.tertiary.withValues(alpha: .16), cs.surface.withValues(alpha: .02), Theme.of(context).scaffoldBackgroundColor]),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Transform.scale(
              scale: 1 + (_controller.value * .045),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      cs.surfaceContainerHighest.withValues(alpha: .66),
                      cs.surface.withValues(alpha: .48),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .24),
                      blurRadius: 52,
                      spreadRadius: 1,
                      offset: const Offset(0, 20),
                    ),
                    BoxShadow(
                      color: cs.primary.withValues(alpha: .12),
                      blurRadius: 36,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const CrestLogo(width: 200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }
}

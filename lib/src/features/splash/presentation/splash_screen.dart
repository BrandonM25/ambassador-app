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
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(shape: BoxShape.circle, color: cs.surface.withValues(alpha: .42), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .28), blurRadius: 42)]),
                child: Image.asset(
                  'assets/branding/ambassador_crest.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                ),
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

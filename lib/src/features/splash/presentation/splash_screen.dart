import 'dart:async';
import 'dart:math' as math;

import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _pulse;
  late final AnimationController _rotate;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);
    _rotate = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
    Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingScreen(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([_pulse, _rotate]),
            builder: (context, _) {
              return Transform.rotate(
                angle: _rotate.value * math.pi * 2,
                child: Container(
                  width: 118,
                  height: 118,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.softGold.withValues(alpha: 0.35), width: 1.1),
                    boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.15 + (_pulse.value * 0.2)), blurRadius: 42)],
                  ),
                  child: Transform.rotate(
                    angle: -_rotate.value * math.pi * 2,
                    child: const Center(child: Text('A', style: TextStyle(fontSize: 56, fontWeight: FontWeight.w700, color: AppColors.ivory))),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    _rotate.dispose();
    super.dispose();
  }
}

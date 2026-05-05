import 'dart:async';

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

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);
    Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen()));
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
            animation: _pulse,
            builder: (context, _) => Container(
              width: 170,
              height: 170,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.champagneGold.withValues(alpha: 0.5), width: 1.3),
                boxShadow: [BoxShadow(color: AppColors.bronzeAccent.withValues(alpha: 0.22 + (_pulse.value * 0.16)), blurRadius: 44)],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(Icons.shield_outlined, color: AppColors.softIvory, size: 96),
                  Positioned(top: 36, child: Icon(Icons.workspace_premium, color: AppColors.champagneGold, size: 22)),
                  Positioned(bottom: 30, child: Icon(Icons.auto_awesome, color: AppColors.sageGlow, size: 12)),
                  Text('A', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.champagneGold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }
}

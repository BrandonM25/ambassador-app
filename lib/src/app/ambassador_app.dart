import 'package:ambassador_app/src/core/constants/app_strings.dart';
import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/features/home/presentation/home_screen.dart';
import 'package:ambassador_app/src/features/learn/presentation/learn_screen.dart';
import 'package:ambassador_app/src/features/practice/presentation/practice_screen.dart';
import 'package:ambassador_app/src/features/profile/presentation/profile_screen.dart';
import 'package:ambassador_app/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AmbassadorApp extends StatelessWidget {
  const AmbassadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: AppStrings.appName, debugShowCheckedModeBanner: false, theme: AppTheme.dark(), home: const SplashScreen());
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int index = 0;
  final screens = const [HomeScreen(), LearnScreen(), PracticeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: AnimatedSwitcher(duration: const Duration(milliseconds: 340), child: KeyedSubtree(key: ValueKey(index), child: screens[index])),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          child: NavigationBar(
            height: 68,
            selectedIndex: index,
            backgroundColor: AppColors.charcoal.withValues(alpha: 0.85),
            indicatorColor: AppColors.gold.withValues(alpha: 0.18),
            onDestinationSelected: (value) => setState(() => index = value),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book_rounded), label: 'Learn'),
              NavigationDestination(icon: Icon(Icons.forum_outlined), selectedIcon: Icon(Icons.forum_rounded), label: 'Practice'),
              NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

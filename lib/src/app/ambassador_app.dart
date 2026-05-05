import 'dart:ui';

import 'package:ambassador_app/src/core/constants/app_strings.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/theme/theme_controller.dart';
import 'package:ambassador_app/src/features/home/presentation/home_screen.dart';
import 'package:ambassador_app/src/features/learn/presentation/learn_screen.dart';
import 'package:ambassador_app/src/features/practice/presentation/practice_screen.dart';
import 'package:ambassador_app/src/features/profile/presentation/profile_screen.dart';
import 'package:ambassador_app/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmbassadorApp extends ConsumerWidget {
  const AmbassadorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const SplashScreen(),
    );
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
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: KeyedSubtree(key: ValueKey(index), child: screens[index])),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.radiusXl),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: NavigationBar(
              selectedIndex: index,
              height: 74,
              backgroundColor: cs.surface.withValues(alpha: .78),
              indicatorColor: cs.primary.withValues(alpha: .2),
              onDestinationSelected: (value) => setState(() => index = value),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: 'Learn'),
                NavigationDestination(icon: Icon(Icons.record_voice_over_rounded), label: 'Practice'),
                NavigationDestination(icon: Icon(Icons.tune_rounded), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
    return MaterialApp(title: AppStrings.appName, debugShowCheckedModeBanner: false, themeMode: mode, theme: AppTheme.light(), darkTheme: AppTheme.dark(), home: const SplashScreen());
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
  final navItems = const [
    (icon: Icons.dashboard_customize_rounded, label: 'Home'),
    (icon: Icons.auto_stories_rounded, label: 'Learn'),
    (icon: Icons.forum_rounded, label: 'Practice'),
    (icon: Icons.tune_rounded, label: 'Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [cs.tertiary.withValues(alpha: .08), Theme.of(context).scaffoldBackgroundColor, cs.primary.withValues(alpha: .05)])),
        child: AnimatedSwitcher(duration: const Duration(milliseconds: 380), child: KeyedSubtree(key: ValueKey(index), child: screens[index])),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: cs.surface.withValues(alpha: .74), borderRadius: BorderRadius.circular(999), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .2), blurRadius: 28, offset: const Offset(0, 12))]),
              child: Row(children: List.generate(navItems.length, (i) {
                final s = i == index;
                final item = navItems[i];
                return Expanded(child: GestureDetector(onTap: () => setState(() => index = i), child: AnimatedContainer(duration: const Duration(milliseconds: 260), padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: s ? cs.primary.withValues(alpha: .2) : Colors.transparent, borderRadius: BorderRadius.circular(999)), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(item.icon, color: s ? cs.primary : cs.onSurfaceVariant), Text(item.label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: s ? cs.onSurface : cs.onSurfaceVariant))]))));
              })),
            ),
          ),
        ),
      ),
    );
  }
}

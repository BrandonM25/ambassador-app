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
      body: AnimatedSwitcher(duration: const Duration(milliseconds: 340), switchInCurve: Curves.easeOutCubic, switchOutCurve: Curves.easeInCubic, child: KeyedSubtree(key: ValueKey(index), child: screens[index])),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(18, 0, 18, 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: cs.surface.withValues(alpha: .72),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: cs.outlineVariant.withValues(alpha: .5)),
              ),
              child: Row(
                children: List.generate(navItems.length, (i) {
                  final selected = i == index;
                  final item = navItems[i];
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: selected ? cs.primary.withValues(alpha: .18) : Colors.transparent,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => setState(() => index = i),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(item.icon, color: selected ? cs.primary : cs.onSurfaceVariant), const SizedBox(height: 4), Text(item.label, style: TextStyle(fontSize: 12, color: selected ? cs.onSurface : cs.onSurfaceVariant, fontWeight: FontWeight.w600))]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

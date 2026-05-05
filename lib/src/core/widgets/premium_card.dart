import 'dart:ui';

import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key, required this.child, this.onTap, this.padding = const EdgeInsets.all(16)});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: cs.surface.withValues(alpha: .84),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    cs.surface.withValues(alpha: .98),
                    cs.surfaceContainerHighest.withValues(alpha: .88),
                  ],
                ),
                border: Border.all(color: cs.outlineVariant.withValues(alpha: .5)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: .12), blurRadius: 24, offset: const Offset(0, 10)),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

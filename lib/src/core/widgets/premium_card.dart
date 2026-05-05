import 'dart:ui';

import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key, required this.child, this.onTap, this.padding = const EdgeInsets.all(18)});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                gradient: LinearGradient(colors: [cs.surface.withValues(alpha: .84), cs.surfaceContainerHighest.withValues(alpha: .65)]),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: .2), blurRadius: 24, offset: const Offset(0, 14)),
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

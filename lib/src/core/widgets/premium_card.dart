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
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Material(
          color: cs.surface.withValues(alpha: .88),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: cs.onSurface.withValues(alpha: .06)),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .14), blurRadius: 20, offset: const Offset(0, 8))],
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

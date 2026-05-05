import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PremiumCard extends StatefulWidget {
  const PremiumCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppTheme.spaceMd),
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  State<PremiumCard> createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _pressed = true),
      onExit: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.99 : 1,
        duration: const Duration(milliseconds: 170),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.cardLift, AppColors.cardDeep],
            ),
            border: Border.all(color: AppColors.glass),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 26, spreadRadius: -7, offset: const Offset(0, 12)),
              BoxShadow(color: AppColors.champagneGold.withValues(alpha: _pressed ? 0.16 : 0.1), blurRadius: _pressed ? 28 : 20, spreadRadius: -8),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              onTap: widget.onTap,
              child: Padding(padding: widget.padding, child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}

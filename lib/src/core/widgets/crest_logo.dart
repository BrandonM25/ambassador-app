import 'package:flutter/material.dart';

class CrestLogo extends StatelessWidget {
  const CrestLogo({super.key, this.size = 120, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/branding/ambassador_crest.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

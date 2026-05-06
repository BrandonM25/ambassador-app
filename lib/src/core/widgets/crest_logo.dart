import 'package:flutter/material.dart';

class CrestLogo extends StatelessWidget {
  const CrestLogo({
    super.key,
    this.width = 120,
    this.height,
  });

  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/branding/ambassador_crest.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}

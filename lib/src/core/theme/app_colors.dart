import 'package:flutter/material.dart';

class AppColors {
  static const navy = Color(0xFF091423);
  static const deepNavy = Color(0xFF0D1A2C);
  static const charcoal = Color(0xFF151B24);
  static const midnight = Color(0xFF11161E);
  static const gold = Color(0xFFC8A768);
  static const softGold = Color(0xFFE0C693);
  static const ivory = Color(0xFFF4F0E7);
  static const slate = Color(0xFF97A1B5);
  static const card = Color(0xFF1A2330);
  static const glass = Color(0x33FFFFFF);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A1422), Color(0xFF101D30), Color(0xFF1A1D27)],
  );

  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A2433), Color(0xFF141A24), Color(0xFF2B241D)],
  );
}

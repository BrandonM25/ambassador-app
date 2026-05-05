import 'package:flutter/material.dart';

class AppColors {
  static const graphiteBlack = Color(0xFF1C1D22);
  static const slateSteel = Color(0xFF5F616B);
  static const softIvory = Color(0xFFF4F1EA);
  static const champagneGold = Color(0xFFD7B26D);
  static const bronzeAccent = Color(0xFFB78545);
  static const sageGlow = Color(0xFFC7D09C);

  static const cardDeep = Color(0xFF23252C);
  static const cardLift = Color(0xFF2A2D35);
  static const glass = Color(0x26F4F1EA);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1C1D22), Color(0xFF22242B), Color(0xFF1A1B20)],
  );

  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2B2D35), Color(0xFF24262D), Color(0xFF332C24)],
  );
}

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF9F54F8);
  static const Color accent = Color(0xFF8932EB);

  static const Color neutral900 = Color(0xFF0F172A);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color white = Color(0xFFFFFFFF);

  static const Color green100 = Color(0xFFDCFCE7);
  static const Color green500 = Color(0xFF22C55E);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color purple100 = Color(0xFFE7D5FF);
  static const Color pink100 = Color(0xFFFFC7CB);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red500 = Color(0xFFEF4444);
  static const Color orange400 = Color(0xFFFB923C);
  static const Color orange500 = Color(0xFFF97316);

  static const List<Color> gradientPurple = [Color(0xFF7421CF), Color(0xFF9F54F8)];
  static const List<Color> gradientBlue = [Color(0xFF0980B8), Color(0xFF61C2D2)];
  static const List<Color> gradientRed = [Color(0xFFFF6773), Color(0xFFFE8B6E)];
  static const List<Color> gradientGreen = [Color(0xFF166534), Color(0xFF22C55E)];
  static const List<Color> gradientGolden = [Color(0xFFCC6002), Color(0xFFFFB532)];
  static const List<Color> gradientIndigo = [Color(0xFF3032A3), Color(0xFF6366F1)];
  static const List<Color> gradientSplashBackground = [Color(0xFFF9F5FF), Color(0xFFD4B4FE)];
  static const List<Color> gradientOnboardingPanel = [white, purple100];

  static const Color chatTimeColor = neutral500;
  static const Color logoWordmark = Color(0xFF131842);
  static const Color secondaryButtonFill = Color(0xFFEEE0FF);
  static const Color buttonGlassBorder = Color(0x5CFFFFFF);
  static const Color bannerText = Color(0xFF56012D);
  static const Color pageBackground = Color(0xFFF5F5F5);

  static List<BoxShadow> inputDropShadow = [
    BoxShadow(color: const Color(0x14344054), offset: const Offset(0, 1), blurRadius: 2),
  ];
  static List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.08), offset: const Offset(0, 1), blurRadius: 1),
  ];
  static List<BoxShadow> otpFocusShadow = [
    BoxShadow(color: primary.withOpacity(0.08), offset: const Offset(0, 2), blurRadius: 10),
  ];
}

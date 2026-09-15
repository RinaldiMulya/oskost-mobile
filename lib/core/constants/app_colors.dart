import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ══════════════════════════════════════════════════════════
  // PRIMARY — Unglazed Terracotta / Fired Earth
  // ══════════════════════════════════════════════════════════
  static const Color primary = Color(0xFF714A23);
  static const Color primaryBrown = Color(0xFF8C6239);
  static const Color primaryLight = Color(0xFFA67C52);
  static const Color primaryDark = Color(0xFF633F19);
  static const Color primaryPressed = Color(0xFF76522E);
  static const Color primaryFixed = Color(0xFFF1BC8C);
  static const Color primaryWash = Color(0xFFFFDCBF);
  static const Color onPrimaryContainer = Color(0xFFFFE8D7);

  // ══════════════════════════════════════════════════════════
  // SECONDARY — Koke Moss (Success & Nature)
  // ══════════════════════════════════════════════════════════
  static const Color secondary = Color(0xFF58614F);
  static const Color secondaryGreen = Color(0xFF5D6654);
  static const Color secondaryContainer = Color(0xFFDCE6CF);
  static const Color secondaryDim = Color(0xFFC0CAB4);
  static const Color onSecondaryContainer = Color(0xFF414939);

  // ══════════════════════════════════════════════════════════
  // TERTIARY — Wood Bark
  // ══════════════════════════════════════════════════════════
  static const Color tertiary = Color(0xFF6F4B26);
  static const Color tertiaryContainer = Color(0xFF8A633B);
  static const Color tertiaryDim = Color(0xFFEEBD8E);

  // ══════════════════════════════════════════════════════════
  // SURFACES — Layer system (Washi Paper / Warm Linen)
  // ══════════════════════════════════════════════════════════
  static const Color background = Color(0xFFFEF8F5);
  static const Color backgroundLight = Color(0xFFF7F4EE); // Layer 0 canvas
  static const Color surface = Color(0xFFFDFBF7); // Layer 1 highlight
  static const Color surfaceCard = Color(0xFFEFECE6); // Layer 1 card
  static const Color surfaceDim = Color(0xFFDED9D6);
  static const Color surfaceContainerLow = Color(0xFFF8F2EF);
  static const Color surfaceContainer = Color(0xFFF2EDE9);
  static const Color surfaceContainerHigh = Color(0xFFEDE7E4);
  static const Color surfaceContainerHighest = Color(0xFFE7E1DE);
  static const Color surfaceElevated = Color(
    0xFFFAF8F3,
  ); // Layer 2 (modal/drawer)

  // ══════════════════════════════════════════════════════════
  // TEXT — Sumi Ink System
  // ══════════════════════════════════════════════════════════
  static const Color neutral = Color(0xFF2B2927); // teks utama
  static const Color textSecondary = Color(0xFF50453B);
  static const Color textMuted = Color(0xFF68635D); // label/overline
  static const Color textTertiary = Color(0xFF948E85); // inactive/data tersier
  static const Color onSurface = Color(0xFF1D1B19);
  static const Color inverseSurface = Color(0xFF32302E);
  static const Color inverseOnSurface = Color(0xFFF5F0EC);

  // ══════════════════════════════════════════════════════════
  // STATUS
  // ══════════════════════════════════════════════════════════
  // Warning — Belum Bayar / Pending (roasted ochre, lembut)
  static const Color warning = Color(0xFFC27D38);
  static const Color warningText = Color(0xFF9E5D26);
  static const Color warningWash = Color(0xFFF5EBE1);

  // Success — Lunas / Aktif (moss tint)
  static const Color success = Color(0xFF5D6654);
  static const Color successText = Color(0xFF4D5745);
  static const Color successWash = Color(0xFFEFF2EC);

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color errorText = Color(0xFF93000A);

  // ══════════════════════════════════════════════════════════
  // BORDERS — Whisper Border (graphite rule)
  // ══════════════════════════════════════════════════════════
  static const Color outline = Color(0xFF82756A);
  static const Color outlineVariant = Color(0xFFD4C3B7);
  static const Color border = Color(0x142B2927); // sumi 8%
  static const Color borderSubtle = Color(0x122B2927); // sumi 7%
  static const Color divider = Color(0x0F2B2927); // sumi 6%

  // ══════════════════════════════════════════════════════════
  // FILLS — Avatar, icon enclosure, ghost button
  // ══════════════════════════════════════════════════════════
  static const Color fillMuted = Color(0x0A2B2927); // sumi 4%
  static const Color fillTerracotta = Color(0x148C6239); // terracotta 8%
  static const Color fillMoss = Color(0x145D6654); // moss 8%
  static const Color fillGlow = Color(
    0x088C6239,
  ); // terracotta 3% (selected glow)

  // ══════════════════════════════════════════════════════════
  // GLASS — Top bar & bottom nav (blur 16px)
  // ══════════════════════════════════════════════════════════
  static const Color glassBar = Color(0xE0F7F4EE); // linen 88%
  static const Color glassNav = Color(0xE6F7F4EE); // linen 90%
  static const Color glassBorder = Color(0x1FFFFFFF);

  // ══════════════════════════════════════════════════════════
  // SHADOWS — Ultra-soft organic
  // ══════════════════════════════════════════════════════════
  static const Color shadow = Color(0x0D2B2927); // sumi 5%
  static const Color shadowSoft = Color(0x082B2927); // sumi 3%

  static const List<BoxShadow> elevation1 = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 6, color: shadowSoft),
  ];

  static const List<BoxShadow> elevation2 = [
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 30,
      spreadRadius: -4,
      color: shadow,
    ),
    BoxShadow(offset: Offset(0, 2), blurRadius: 6, color: shadowSoft),
  ];

  // ══════════════════════════════════════════════════════════
  // GRADIENT
  // ══════════════════════════════════════════════════════════
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBrown, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

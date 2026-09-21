import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';

abstract class HeadLineTexts {
  static TextStyle headlineLarge = GoogleFonts.spaceGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.importantTexts,
  );

  static TextStyle headlineMedium = GoogleFonts.spaceGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.importantTexts,
  );

  static TextStyle headlineSmall = GoogleFonts.spaceGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.importantTexts,
  );
}

abstract class BodyTexts {
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.texts,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.texts,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.texts,
  );
}

abstract class LabelTexts {
  static TextStyle labelLarge = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.texts,
  );

  static TextStyle labelMedium = GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.texts,
  );

  static TextStyle labelSmall = GoogleFonts.spaceGrotesk(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.texts,
  );
}

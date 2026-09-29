import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';

class InformationcardWidget extends StatelessWidget {
  final String label;
  final String information;

  InformationcardWidget({
    super.key,
    required this.label,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.secondaryTheme),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text(label, style: LabelTexts.labelLarge),
          Text(information, style: BodyTexts.bodyMedium),
        ],
      ),
    );
  }
}

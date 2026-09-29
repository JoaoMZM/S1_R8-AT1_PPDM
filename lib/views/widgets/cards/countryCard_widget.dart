import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';

class CountrycardWidget extends StatelessWidget {
  final Map country;

  const CountrycardWidget({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondaryTheme),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            country["placement"].toString(),
            style: BodyTexts.bodyMedium.copyWith(
              color: AppColors.secondaryTheme,
            ),
          ),
          Text(country["title"], style: BodyTexts.bodyMedium),
          Text(country["points"], style: BodyTexts.bodyMedium),
        ],
      ),
    );
  }
}

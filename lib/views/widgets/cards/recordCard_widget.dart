import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';

class RecordcardWidget extends StatelessWidget {
  final Map record;
  const RecordcardWidget({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryTheme),
        color: AppColors.cardBackground
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(record["user"]["username"], style: BodyTexts.bodyMedium),
          Text(
            '${record["percent"]}%',
            style: BodyTexts.bodyMedium.copyWith(
              color: record["percent"] == 100 ? Colors.green : AppColors.texts,
            ),
          ),
        ],
      ),
    );
  }
}

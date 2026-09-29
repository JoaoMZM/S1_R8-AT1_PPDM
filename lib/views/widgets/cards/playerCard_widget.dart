import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/views/screens/player_screen.dart';

class PlayercardWidget extends StatelessWidget {
  final Map player;
  const PlayercardWidget({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScreen(id: player["id"]),
          ),
        );
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.secondaryTheme)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              player["placement"].toString(),
              style: BodyTexts.bodyMedium.copyWith(
                color: AppColors.secondaryTheme,
              ),
            ),
            Text(player["username"], style: BodyTexts.bodyMedium),
            Text(player["points"], style: BodyTexts.bodyMedium),
          ],
        ),
      ),
    );
  }
}

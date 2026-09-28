import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class LevelcardWidget extends StatelessWidget {
  final int id;
  final int placement;
  final String name;
  final String points;
  final String holder;
  final Map verifier;
  final String verificationUrl;
  final bool futureList;
  LevelcardWidget({
    super.key,
    required this.id,
    required this.placement,
    required this.name,
    required this.points,
    required this.holder,
    required this.verifier,
    required this.verificationUrl,
    required this.futureList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryTheme),
        color: AppColors.cardBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          GestureDetector(
            onTap: () async {
              final url = Uri.parse(verificationUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Image.network(
              'https://thumbnails.demonlist.org/${futureList ? 'future' : 'classic'}/$id.png',
              width: 150,
              height: 116,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '#$placement ',
                      style: BodyTexts.bodyLarge.copyWith(
                        color: AppColors.secondaryTheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: name, style: BodyTexts.bodyLarge),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(holder, style: BodyTexts.bodyMedium),
                  Text(
                    '|',
                    style: BodyTexts.bodyMedium.copyWith(
                      color: AppColors.background.withAlpha(40),
                    ),
                  ),
                  Text(
                    verifier["username"],
                    style: BodyTexts.bodyMedium.copyWith(
                      color: AppColors.tertiaryTheme,
                    ),
                  ),
                  Text(
                    '•',
                    style: BodyTexts.bodyMedium.copyWith(
                      color: AppColors.background.withAlpha(40),
                    ),
                  ),
                  Text(
                    points,
                    style: BodyTexts.bodyMedium.copyWith(
                      color: AppColors.secondaryTheme,
                    ),
                  ),
                  Text(
                    'points',
                    style: BodyTexts.bodySmall.copyWith(
                      color: AppColors.background.withAlpha(40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

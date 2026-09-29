import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/views/screens/level_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LevelcardWidget extends StatelessWidget {
  final int id;
  final int placement;
  final String name;
  final String points;
  final String holder;
  final Map verifier;
  final String verificationUrl;

  const LevelcardWidget({
    super.key,
    required this.id,
    required this.placement,
    required this.name,
    required this.points,
    required this.holder,
    required this.verifier,
    required this.verificationUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LevelScreen(id: id)),
        );
      },
      child: Container(
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
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: Container(
                width: 150,
                height: 116,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://thumbnails.demonlist.org/${'classic'}/$id.png',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(holder, style: BodyTexts.bodyMedium),
                      Text(
                        verifier["username"],
                        style: BodyTexts.bodyMedium.copyWith(
                          color: AppColors.tertiaryTheme,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            (double.parse(points) / 4).toString(),
                            style: BodyTexts.bodyMedium,
                          ),
                          Text(' — ', style: BodyTexts.bodyMedium),
                          Text(
                            points,
                            style: BodyTexts.bodyMedium.copyWith(
                              color: AppColors.secondaryTheme,
                            ),
                          ),
                        ],
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
            ),
          ],
        ),
      ),
    );
  }
}

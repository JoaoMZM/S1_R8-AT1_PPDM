import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/views/screens/level_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class FuturelevelcardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String category;
  final String showcaseUrl;
  const FuturelevelcardWidget({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.showcaseUrl,
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
              final url = Uri.parse(showcaseUrl);
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
                    'https://thumbnails.demonlist.org/${'future'}/$id.png',
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
                Text(name, style: BodyTexts.bodyLarge),
                Text(category, style: BodyTexts.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

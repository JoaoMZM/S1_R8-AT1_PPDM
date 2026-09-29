import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';

class PlayerScreen extends StatefulWidget {
  final int id;
  const PlayerScreen({super.key, required this.id});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  Map player = {};
  void pegarDados() async {
    player = await ApiService.getUser(widget.id);
    print(player);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarDados();
  }

  @override
  Widget build(BuildContext context) {
    if (player.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primaryTheme),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(player["username"], style: HeadLineTexts.headlineLarge),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                border: Border.all(color: AppColors.secondaryTheme),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Text(player["username"], style: HeadLineTexts.headlineMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "#${player["placement"]}",
                            style: BodyTexts.bodyLarge,
                          ),
                          Text("Rank", style: LabelTexts.labelLarge),
                        ],
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${player["points"]}",
                            style: BodyTexts.bodyLarge,
                          ),
                          Text("Score", style: LabelTexts.labelLarge),
                        ],
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

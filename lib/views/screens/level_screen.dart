import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/informationCard_widget.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/recordCard_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LevelScreen extends StatefulWidget {
  final int id;
  LevelScreen({super.key, required this.id});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  Map level = {};
  List records = [];
  List<String> labels = [
    'ID',
    'PASSWORD',
    'LENGTH',
    'OBJECTS',
    'VERSION',
    'TOTAL SCORE',
  ];
  List informations = [];
  late YoutubePlayerController playerController;

  void pegarDados() async {
    level = await ApiService.getLevel(widget.id);
    records = await ApiService.getRecords(widget.id);
    informations = [
      level['ingame_id'].toString(),
      level['copy_info']['password'] ?? "Free Copy",
      ("${level['length'] ~/ 60}:${level['length'] % 60}").toString(),
      level['objects'].toString(),
      level['game_version'].toString(),
      level['points'],
    ];
    print(informations);
    setState(() {});
    final String videoId =
        Uri.parse(level["verification"]["video_url"]).queryParameters['v'] ??
        '';
    playerController = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarDados();
  }

  @override
  Widget build(BuildContext context) {
    if(level.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primaryTheme,),),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(level["name"], style: HeadLineTexts.headlineLarge),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Text(
                  level["description"],
                  style: LabelTexts.labelLarge,
                  textAlign: TextAlign.center,
                ),
                YoutubePlayer(controller: playerController),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    SizedBox(width: double.maxFinite),
                    ...List.generate(labels.length, (index) {
                      return InformationcardWidget(
                        label: labels[index],
                        information: informations[index],
                      );
                    }),
                  ],
                ),
                Text('Records', style: HeadLineTexts.headlineSmall),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    SizedBox(width: double.maxFinite),
                    ...List.generate(records.length, (index) {
                      return RecordcardWidget(record: records[index]);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

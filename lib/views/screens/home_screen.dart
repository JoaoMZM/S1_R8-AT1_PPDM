import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/levelCard_widget.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List levels = [];

  void pegarDados() async {
    levels = await ApiService.getLevels();
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
    return Scaffold(body: ListView.builder(itemCount: levels.length, itemBuilder: (context, index) {
      Map level = levels[index];
      return LevelcardWidget(id: level["id"], placement: level["placement"], name: level["name"], points: level["points"], holder: level["holder"], verifier: level["verifier"], verificationUrl: level["verification_url"], futureList: false);
    }));
  }
}

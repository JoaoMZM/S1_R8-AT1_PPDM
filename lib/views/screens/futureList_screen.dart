import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/futureLevelCard_widget.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/levelCard_widget.dart';

class FuturelistScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FuturelistScreen> createState() => FuturelistScreenState();
}

class FuturelistScreenState extends State<FuturelistScreen> {
  List levels = [];

  int paginaAtual = 1;

  static const int itensPorPagina = 30;

  int get totalPages => (levels.length / itensPorPagina).ceil();

  List get levelsAtuais {
    final comeco = (paginaAtual - 1) * itensPorPagina;
    final fim = (comeco + itensPorPagina).clamp(0, levels.length);

    return levels.sublist(comeco, fim);
  }

  void pegarDados() async {
    levels = await ApiService.getFutureLevels();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pegarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: levelsAtuais.length,
              itemBuilder: (context, index) {
                Map level = levelsAtuais[index];

                return FuturelevelcardWidget(
                  id: level["id"],
                  name: level["name"],
                  category: level["category"],
                  showcaseUrl: level["showcase_url"],
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: paginaAtual > 1
                    ? () {
                        setState(() {
                          paginaAtual--;
                        });
                      }
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),

               Text('Página $paginaAtual', style: BodyTexts.bodySmall),

              IconButton(
                onPressed: paginaAtual < totalPages
                    ? () {
                        setState(() {
                          paginaAtual++;
                        });
                      }
                    : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

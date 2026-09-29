import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/levelCard_widget.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List levels = [];

  int paginaAtual = 1;

  static const int itensPorPagina = 30;

  bool carregando = false;
  bool temProximaPagina = true;

  Future<void> pegarDados() async {
    setState(() {
      carregando = true;
    });

    final novosLevels = await ApiService.getLevels(
      itensPorPagina,
      (paginaAtual - 1) * itensPorPagina,
    );

    setState(() {
      levels = novosLevels;
      temProximaPagina = novosLevels.length == itensPorPagina;
      carregando = false;
    });
  }

  Future<void> proximaPagina() async {
    if (carregando || !temProximaPagina) return;

    setState(() {
      paginaAtual++;
    });

    await pegarDados();
  }

  Future<void> paginaAnterior() async {
    if (carregando || paginaAtual <= 1) return;

    setState(() {
      paginaAtual--;
    });

    await pegarDados();
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
            child: carregando
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: levels.length,
                    itemBuilder: (context, index) {
                      Map level = levels[index];

                      return LevelcardWidget(
                        id: level["id"],
                        placement: level["placement"],
                        name: level["name"],
                        points: level["points"].toString(),
                        holder: level["holder"],
                        verifier: level["verifier"],
                        verificationUrl: level["verification_url"],
                      );
                    },
                  ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: paginaAtual > 1 && !carregando
                    ? paginaAnterior
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),

              Text('Página $paginaAtual', style: BodyTexts.bodySmall,),

              IconButton(
                onPressed: !carregando && temProximaPagina
                    ? proximaPagina
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

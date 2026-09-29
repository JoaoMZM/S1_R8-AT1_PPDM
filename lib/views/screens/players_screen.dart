import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/playerCard_widget.dart';

class PlayersScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  List players = [];

  int paginaAtual = 1;

  static const int itensPorPagina = 30;

  bool carregando = false;
  bool temProximaPagina = true;

  Future<void> pegarDados() async {
    setState(() {
      carregando = true;
    });

    final novosPlayers = await ApiService.getUsers(
      itensPorPagina,
      (paginaAtual - 1) * itensPorPagina,
    );

    setState(() {
      players = novosPlayers;
      temProximaPagina = novosPlayers.length == itensPorPagina;
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
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return PlayercardWidget(player: players[index]);
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

              Text('Página $paginaAtual', style: BodyTexts.bodySmall),

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

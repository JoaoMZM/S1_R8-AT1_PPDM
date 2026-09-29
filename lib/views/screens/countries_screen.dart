import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/services/api_service.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/cards/countryCard_widget.dart';

class CountriesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List countries = [];

  int paginaAtual = 1;

  static const int itensPorPagina = 30;

  Future<void> pegarDados() async {
    countries = await ApiService.getCountries();

    setState(() {});
  }

  int get totalPaginas => (countries.length / itensPorPagina).ceil();

  List get countriesAtuais {
    final comeco = (paginaAtual - 1) * itensPorPagina;
    final fim = (comeco + itensPorPagina).clamp(0, countries.length);

    return countries.sublist(comeco, fim);
  }

  @override
  void initState() {
    super.initState();
    pegarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: countries.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: countriesAtuais.length,
                    itemBuilder: (context, index) {
                      return CountrycardWidget(country: countriesAtuais[index]);
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

                    Text(
                      'Página $paginaAtual',
                      style: BodyTexts.bodySmall,
                    ),

                    IconButton(
                      onPressed: paginaAtual < totalPaginas
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

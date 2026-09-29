import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/notifiers.dart';
import 'package:s1_r8_at1_ppdm/views/screens/countries_screen.dart';
import 'package:s1_r8_at1_ppdm/views/screens/futureList_screen.dart';
import 'package:s1_r8_at1_ppdm/views/screens/home_screen.dart';
import 'package:s1_r8_at1_ppdm/views/screens/players_screen.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/drawer_widget.dart';

class WidgetTree extends StatelessWidget {
  WidgetTree({super.key});

  List<Widget> pages = [
    HomeScreen(),
    FuturelistScreen(),
    PlayersScreen(),
    CountriesScreen(),
  ];

  List<String> titles = [
    'Main List',
    'Future List',
    'Players Ranking',
    'Countries Ranking',
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              titles.elementAt(selectedPage),
              style: HeadLineTexts.headlineLarge,
            ),
          ),
          drawer: DrawerWidget(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: pages.elementAt(selectedPage),
            ),
          ),
        );
      },
    );
  }
}

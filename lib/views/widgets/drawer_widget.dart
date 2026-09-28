import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_texts.dart';
import 'package:s1_r8_at1_ppdm/notifiers.dart';

class DrawerWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
        return Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text(titles.elementAt(0), style: BodyTexts.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  selectedPageNotifier.value = 0;
                },
              ),
              ListTile(
                title: Text(titles.elementAt(1), style: BodyTexts.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  selectedPageNotifier.value = 1;
                },
              ),
              ListTile(
                title: Text(titles.elementAt(2), style: BodyTexts.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  selectedPageNotifier.value = 2;
                },
              ),
              ListTile(
                title: Text(titles.elementAt(3), style: BodyTexts.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  selectedPageNotifier.value = 3;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

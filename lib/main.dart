import 'package:flutter/material.dart';
import 'package:s1_r8_at1_ppdm/constants/app_colors.dart';
import 'package:s1_r8_at1_ppdm/views/widgets/widget_tree.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        drawerTheme: DrawerThemeData(backgroundColor: AppColors.background),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          iconTheme: IconThemeData(color: AppColors.texts),
        ),
      ),
      home: WidgetTree(),
    );
  }
}

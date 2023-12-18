// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    // Providers are above [App] instead of inside it, so that tests can use [App] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MaterialThemesManager()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialThemesManager>(
      builder: (context, themeManager, child) {
        return MaterialApp(
          title: "Theme Manager Demo",
          debugShowCheckedModeBanner: false,
          themeMode: themeManager.getThemeMode(),
          theme: themeManager.getPrimaryLightTheme(),
          darkTheme: themeManager.getPrimaryDarkTheme(),
          home: const HomePage(),
        );
      },
    );
  }
}
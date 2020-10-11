import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:material_themes_widgets/screens/onboarding_screen.dart';

void main() {
  runApp(
    // Providers are above [App] instead of inside it, so that tests can use [App] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MaterialThemesManager()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
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
          /*home: Scaffold(
            body: OnboardingScreen(
              title: "Yo Mamma",
              imageUrl: "assets/food_1.jpg",
              description: "alkjasldjf askldjf asdf kasas dflasjd fkljasd klfjas d fjkasd",
              audioUrl: "assets/audios/demo.mp3",
            )
          )*/

          home: Container(
            child: HomePage(),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'main_pager.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MaterialThemesManager>(
      builder: (context) => MaterialThemesManager(),
      child:HomePage())
  );
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}*/

class HomePage extends StatelessWidget {
  //We are consuming the theme change at the app level because light/dark mode swap
  //affects every widget's appearance in the app
  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialThemesManager>(
        builder: (context, themeManager, child){
          return MaterialApp(
            title: "Theme Manager Demo",
            debugShowCheckedModeBanner: false,
            theme: themeManager.getPrimaryLightTheme(),
            darkTheme: themeManager.getPrimaryDarkTheme(),
            home: MainPager(),
            themeMode: themeManager.getThemeMode(),
          );
        }
    );
  }
}
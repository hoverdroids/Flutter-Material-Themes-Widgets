import 'package:flutter/material.dart';
import 'package:material_themes_widgets/drawers/liquid_drawer.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/lists/scaling_items_list.dart';
import 'package:provider/provider.dart';
import 'package:material_themes_widgets/drawers/simple_clith_path_drawer.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MaterialThemesManager>(
      builder: (context) => MaterialThemesManager(),
      child:MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: SimpleClipPathDrawer(
        child: ScalingItemsList(
            "assets/food_1.jpg",
            [
              ListItemModel("My Item 1", Icons.add, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 2", Icons.account_circle, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 3", Icons.ac_unit, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 4", Icons.access_alarm, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 5", Icons.access_time, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 6", Icons.accessible, iconClickedCallback: () => print("Clicked item 1")),
              ListItemModel("My Item 7", Icons.filter_drama, iconClickedCallback: () => print("Clicked item 1"))
            ]
        ),
        clipPathType: ClipPathType.CLOUDS,
      ),
    );
  }
}

//TODO - ADD THE FOLLOWING BACK INTO THE EXAMPLE
/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'main_pager.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MaterialThemesManager>(
      builder: (context) => MaterialThemesManager(),
      child: HomeApp(),
    ),
  );
}

class HomeApp extends StatelessWidget {
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



















 */

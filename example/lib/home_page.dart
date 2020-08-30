import 'package:flutter/material.dart';

import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/drawers/simple_clith_path_drawer.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:material_themes_widgets/lists/scaling_items_list.dart';
import 'package:material_themes_widgets/screens/login_screen.dart';
import 'grayscale_theme_list_items_page.dart';
import 'main_theme_list_items_page.dart';
import 'wireframe_theme_list_items_page.dart';
import 'package:material_themes_manager/material_themes_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedItem = 0;

  //TODO - are any/all of the following possible/
  //primary (ie primary cards on primary bg)
  //what you'd expect (ie primary cards on white/black bg)
  //inverted (ie white/black cards on primary bg)
  var _pages = [
    WireframeThemeListItemsPage(),
    GrayscaleThemeListItemsPage(),
    MainThemeListItemsPage(),
  ];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //TODO - each page needs its own appbar and navbar to prove the point
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index){
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("hey hey"),
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
      endDrawer: SimpleClipPathDrawer(
        child: LoginScreen(),
        clipPathType: ClipPathType.CLOUDS,
        backgroundGradientType: BackgroundGradientType.PRIMARY,
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('List on Main Color')),
          BottomNavigationBarItem(icon: Icon(Icons.photo), title: Text('List on Primary Color')),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
            _pageController.animateToPage(
                _selectedItem,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear
            );
          });
        },
      ),*/
    );
  }
}
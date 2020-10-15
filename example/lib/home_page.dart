import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/drawers/simple_clith_path_drawer.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:material_themes_widgets/lists/header_list.dart';
import 'package:material_themes_widgets/screens/login_register_screen.dart';
import 'package:material_themes_widgets/screens/onboarding_screen.dart';
import 'package:material_themes_widgets/screens/profile_screen.dart';
import 'grayscale_theme_list_items_page.dart';
import 'main_theme_list_items_page.dart';
import 'wireframe_theme_list_items_page.dart';
import 'package:material_themes_manager/material_themes_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedItem = 0;

  //TODO - are any/all of the following possible/
  //primary (ie primary cards on primary bg)
  //what you'd expect (ie primary cards on white/black bg)
  //inverted (ie white/black cards on primary bg)
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //TODO - each page needs its own appbar and navbar to prove the point
    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        children: <Widget>[
          WireframeThemeListItemsPage(_scaffoldKey),
          GrayscaleThemeListItemsPage(_scaffoldKey),
          MainThemeListItemsPage(_scaffoldKey),
          OnboardingScreen(
            title: "Yo Mamma",
            titleMainAxisAlignment: MainAxisAlignment.end,
            descriptionFlex: 4,
            imageUrl: "assets/food_1.jpg",
            description: "alkjasldjf askldjf asd4 1fs54d fsd4 f465sdf1 321sdf 1856s1df s5d1f 68s1df 65s1df56 s1d68f1s d651f s685d1f 35s1df851 sd35f1s85d61fs635d fs865d sf asdf kasas dflasjd fkljasd klfjas d fjkasd asdfasd fasdf asd fasd fasdf asdf asdf asdf asd fasdf asd fasdf asdf asdf asdf asdf asdf asdf asdf asd f  adksf alksdf kjaredsfj lkasjdfoi jasdmf oasjdkif askdjf olkasjdl sd lfsldjlkd ajsdlaskdj lsfkakdjflkdflasdl falsdlkdkjasl alsdjfad fjasldjflasjfajdl asdjaldj ",
            audioUrl: "assets/audios/demo.mp3",
            descriptionTextAlign: TextAlign.justify,
            descriptionMainAxisAlignment: MainAxisAlignment.center,
            imageFit: BoxFit.cover,
          )
        ],
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
        leftIconType: ThemeGroupType.MOI,
        leftIconClickedCallback: () => Navigator.pop(context),
        rightIconType: ThemeGroupType.MOI,
        rightIconClickedCallback: () => _scaffoldKey.currentState.openEndDrawer(),
        child: HeaderList(
            [
              ListItemModel(title: "Drama Mama", subtitle: "Lookie here", trailingIcon: Icons.more_vert),
              ListItemModel(title: "Drama Papa", leadingIcon: Icons.filter_drama),
              ListItemModel(title: "Your drama", leadingIcon: Icons.add, itemClickedCallback: () => print("Clicked your drama")),
              ListItemModel(leadingIcon: Icons.account_circle),
              ListItemModel(leadingIcon: Icons.access_alarm, itemClickedCallback: () => print("Clicked item 4")),
              ListItemModel(title: "Drama Mama"),
              ListItemModel(title: "Drama Papa", leadingIcon: Icons.filter_drama),
              ListItemModel(title: "Your drama", leadingIcon: Icons.add, itemClickedCallback: () => print("Clicked your drama")),
              ListItemModel(leadingIcon: Icons.account_circle),
              ListItemModel(leadingIcon: Icons.access_alarm, itemClickedCallback: () => print("Clicked item 4")),
            ],
          //cardElevationLevel: ElevationLevel.FLAT,
          imageUrl: "assets/food_1.jpg",
          //avatarImageUrl: "assets/food_1.jpg",
          //imageBlendColor: Colors.orangeAccent,
          //imageBlendMode: BlendMode.color,
          headerGradientType: BackgroundGradientType.PRIMARY,
          //headerFlex: 4,
          //itemsFlex: 2,
          //isHeaderSticky: false,
          //isAvatarEnabled: true,
          //headerAlignment: AlignmentDirectional.bottomCenter,
          avatarClickedCallback: () => _scaffoldKey.currentState.openEndDrawer(),
          //usePolygonAvatar: true,
        ),
        clipPathType: ClipPathType.CLOUDS,
        padding: 0.0,
      ),
      endDrawer: SimpleClipPathDrawer(
        leftIconType: ThemeGroupType.MOP,
        leftIconClickedCallback: () => Navigator.pop(context),
        rightIcon: Icons.edit,
        rightIconType: ThemeGroupType.MOP,
        child: SafeArea(
          child: ProfileScreen(
            onEmailChangedCallback: (value) => { print("Email changed" + value) },
            onPasswordChangedCallback: (value) => { print("Password changed" + value) },
            onTapEdit: () => print("On tap Edit2"),
            onTapSave: () => print("on tap save2"),
            isFooterVertical: false,
            isEditMode: true,
            showLabels: true,
            email: "spragucm@gmail.com",
            password: "abc123",
            firstName: "Chris",
            lastName: "Sprague",
            tagline: "Guy who types",
            pronouns: "M",
            organization: "tCubed Studios",
            address: "123",
            city: "Boons",
            state: "NC",
            zip: "81203"
          )
        ),
        padding: 0.0,
        clipPathType: ClipPathType.NONE,
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
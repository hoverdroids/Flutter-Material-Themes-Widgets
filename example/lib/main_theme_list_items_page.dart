import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/fundamental/toggles.dart';
import 'package:material_themes_widgets/fundamental/cards.dart';

//This will appear as the user expects with standard theming in light/dark (e.g. white/black bg with colors on buttons and titles, all else are greys)
class MainThemeListItemsPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  MainThemeListItemsPage(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.POM).appBarTheme.color,//TODO - clunky but it's hard to subclass appbar
          title: ThemedTitle('Primary on Main', type: ThemeGroupType.MOP),
          //elevation: 0,//removes the shadow
          leading: ThemedIconButton(
              Icons.menu,
              type: ThemeGroupType.MOP,
              onPressedCallback: () => scaffoldKey.currentState.openDrawer(),
          ),
          actions: <Widget>[
            ThemedSwitch(
              type: ThemeGroupType.MOP,
              value: context.watch<MaterialThemesManager>().isDarkModeEnabled,
              onChanged: (boolVal) {
                context.read<MaterialThemesManager>().updateDarkModeEnabled(boolVal);
              },
            )
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, pos) {
              return ThemedCard(
                child: ListTile(
                  title: ThemedTitle("Title $pos", type: ThemeGroupType.POM),
                  subtitle: ThemedSubTitle("SubTitle $pos", type: ThemeGroupType.MOM),
                  leading: ThemedIcon(Icons.alarm, type: ThemeGroupType.MOM),
                  trailing: ThemedIcon(Icons.chevron_right, type: ThemeGroupType.MOM),
                ),
              );
            },
          ),
        )
    );
  }
}
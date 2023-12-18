// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/fundamental/toggles.dart';
import 'package:material_themes_widgets/fundamental/cards.dart';

//This will appear as the user expects with standard theming in light/dark (e.g. white/black bg with colors on buttons and titles, all else are greys)
class GrayscaleThemeListItemsPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const GrayscaleThemeListItemsPage(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).appBarTheme.backgroundColor,//TODO - clunky but it's hard to subclass appbar
          title: ThemedTitle('Grayscale', type: ThemeGroupType.MOM),
          //elevation: 0,//removes the shadow
          leading: ThemedIconButton(
            Icons.menu,
            type: ThemeGroupType.MOM,
            onPressedCallback: () => scaffoldKey.currentState?.openDrawer(),
          ),
          actions: <Widget>[
            ThemedSwitch(
              type: ThemeGroupType.MOM,
              value: context.watch<MaterialThemesManager>().isDarkModeEnabled,
              onChanged: (boolVal) {
                context.read<MaterialThemesManager>().updateDarkModeEnabled(boolVal);
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, pos) {
            return ThemedListTileCard(title: "Title $pos", subtitle: "Subtitle $pos");
          },
        )
    );
  }
}
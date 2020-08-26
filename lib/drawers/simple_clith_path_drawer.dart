import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:provider/provider.dart';

class SimpleClipPathDrawer extends StatelessWidget {

  Widget child;
  final double padding;
  final ClipPathType clipPathType;
  final ThemeGroupType type;

  SimpleClipPathDrawer({
    child, this.padding = 14.0,
    this.clipPathType = ClipPathType.BOILER_PLATE,
    background,
    this.type = ThemeGroupType.MOM,
  }) {
    this.child = child != null ? child : Container();//TODO - we can't pass null but can't instantiate the Container as a default because, "the default value of an optional param must be constant"
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        child: ClipPath(
          child: Drawer(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //TODO - extend the ThemeData so we can use gradients
                        Provider.of<MaterialThemesManager>(context).getTheme(type).cardTheme.color,
                        Provider.of<MaterialThemesManager>(context).getTheme(type).cardTheme.color,
                      ],
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
          clipper: SimpleClipPath(type: clipPathType),
        ),
        padding: EdgeInsets.all(padding),
      ),
    );
  }
}
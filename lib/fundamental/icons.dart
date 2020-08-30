import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedIcon extends StatelessWidget {

  final IconData icon;
  final Key key;
  final IconSize size;
  final ThemeGroupType type;
  final String semanticLabel;
  final TextDirection textDirection;

  ThemedIcon(
      this.icon,
      {
        this.type  = ThemeGroupType.MOM,
        this.key,
        this.size = IconSize.SMALL,
        this.semanticLabel,
        this.textDirection
      }
  );

  @override
  Widget build(BuildContext context) {

    //construct a default widget in order to fall back on default values when the optional params aren't passed
    var defaultIcon = Icon(icon);

    return Consumer<MaterialThemesManager> (
      builder: (context, themeManager, child) {
        return Icon(
          icon,
          key: key != null ? key : defaultIcon.key,
          size: themeManager.getTheme(type, iconSize: size).iconTheme.size,
          color: themeManager.getTheme(type).iconTheme.color,
          semanticLabel: semanticLabel != null ? semanticLabel : defaultIcon.semanticLabel,
          textDirection: textDirection != null ? textDirection : defaultIcon.textDirection,
        );
      },
    );
  }
}
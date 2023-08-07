import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedIcon extends StatelessWidget {

  final IconData? icon;
  final Key? key;
  final IconSize iconSize;
  final ThemeGroupType type;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final Emphasis emphasis;

  ThemedIcon(
      this.icon,
      {
        this.type  = ThemeGroupType.MOM,
        this.key,
        this.iconSize = IconSize.SMALL,
        this.semanticLabel,
        this.textDirection,
        this.emphasis = Emphasis.NONE
      }
  );

  @override
  Widget build(BuildContext context) {

    //construct a default widget in order to fall back on default values when the optional params aren't passed
    var defaultIcon = Icon(icon);

    return Icon(
      icon,
      key: key ?? defaultIcon.key,
      size: context.watch<MaterialThemesManager>().getTheme(type, iconSize: iconSize).iconTheme.size,
      color: context.watch<MaterialThemesManager>().getTheme(type, emphasis: emphasis).iconTheme.color,
      semanticLabel: semanticLabel ?? defaultIcon.semanticLabel,
      textDirection: textDirection ?? defaultIcon.textDirection,
    );
  }
}

class ThemedIconButton extends StatelessWidget {

  final IconData? icon;
  final Key? key;
  final IconSize iconSize;
  final ThemeGroupType type;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final VoidCallback? onPressedCallback;
  final Emphasis emphasis;

  ThemedIconButton(
    this.icon,
      {
        this.type  = ThemeGroupType.MOM,
        this.key,
        this.iconSize = IconSize.SMALL,
        this.semanticLabel,
        this.textDirection,
        this.onPressedCallback,
        this.emphasis = Emphasis.NONE
      }
  );

  @override
  Widget build(BuildContext context) {

    var buttonIcon = ThemedIcon(
      icon,
      key: key,
      iconSize: iconSize,
      type: type,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      emphasis: emphasis
    );

    return IconButton(
      onPressed: onPressedCallback ?? () => print("Tapped ${icon.toString()}"),
      icon: buttonIcon,
      // TODO iconSize: appbarIconSize,
      // TODO color: iconDarkBgColor,
      // TODO padding: EdgeInsets.only(right: appbarIconMargin),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ThemedIcon extends StatelessWidget {

  final IconData? icon;
  final IconSize iconSize;
  final ThemeGroupType type;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final Emphasis emphasis;

  const ThemedIcon(
      this.icon,
      {
        super.key,
        this.type  = ThemeGroupType.MOM,
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
  final IconSize iconSize;
  final ThemeGroupType type;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final VoidCallback? onPressedCallback;
  final Emphasis emphasis;

  const ThemedIconButton(
    this.icon,
      {
        super.key,
        this.type  = ThemeGroupType.MOM,
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
      onPressed: onPressedCallback ?? () => developer.log("Tapped ${icon.toString()}"),
      icon: buttonIcon,
      // TODO iconSize: appbarIconSize,
      // TODO color: iconDarkBgColor,
      // TODO padding: EdgeInsets.only(right: appbarIconMargin),
    );
  }
}
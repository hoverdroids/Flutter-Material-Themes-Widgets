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
/// An icon button meant to sit on top of photos, cards or other content whose colors aren't known
/// ahead of time. The icon is drawn on a dark, translucent circle with a light outline, so it stays
/// visible on white cards, dark photos and everything in between.
class ThemedOverlayIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressedCallback;
  final String? tooltip;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  const ThemedOverlayIconButton(
    this.icon,
      {
        super.key,
        this.onPressedCallback,
        this.tooltip,
        this.iconSize = 24.0,
        this.iconColor = Colors.white,
        this.backgroundColor = const Color(0x99000000),
        this.borderColor = const Color(0xCCFFFFFF),
      }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: backgroundColor,
        shape: CircleBorder(side: BorderSide(color: borderColor, width: 1.5)),
        clipBehavior: Clip.antiAlias,
        child: IconButton(
          icon: Icon(icon, size: iconSize, color: iconColor),
          tooltip: tooltip,
          onPressed: onPressedCallback ?? () => developer.log("Tapped ${icon.toString()}"),
        ),
      ),
    );
  }
}

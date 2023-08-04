import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

import 'icons.dart';

class ThemedCard extends Card {
  
  final ThemeGroupType type;
  final ElevationLevel elevationLevel;
  
  ThemedCard({
    key,
    this.type = ThemeGroupType.MOM,
    shadowColor,
    this.elevationLevel = ElevationLevel.LOW,
    shape,
    borderOnForeground = true,
    margin,
    clipBehavior,
    child,
    semanticContainer = true,
  }): super(
    key: key,
    shadowColor: shadowColor,
    shape: shape,
    borderOnForeground: borderOnForeground,
    margin: margin,
    clipBehavior: clipBehavior,
    child: child,
    semanticContainer: semanticContainer,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      color: context.watch<MaterialThemesManager>().getTheme(type).cardTheme.color,
      shadowColor: shadowColor,
      elevation: context.watch<MaterialThemesManager>().getTheme(type, elevationLevel: elevationLevel).cardTheme.elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      child: child,
      semanticContainer: semanticContainer,
    );
  }
}

class ThemedListTileCard extends Card {

  final ThemeGroupType type;
  final ElevationLevel elevationLevel;
  final VoidCallback? itemClickedCallback;
  final VoidCallback? itemLongClickedCallback;

  final IconData? leadingIcon;
  final ThemeGroupType leadingType;
  final Emphasis leadingEmphasis;
  final VoidCallback? leadingIconClickedCallback;
  final String? title;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final String? subtitle;
  final ThemeGroupType subtitleType;
  final Emphasis subtitleEmphasis;
  final IconData? trailingIcon;
  final ThemeGroupType trailingType;
  final Emphasis trailingEmphasis;
  final VoidCallback? trailingIconClickedCallback;

  ThemedListTileCard({
    key,
    this.type = ThemeGroupType.MOM,
    this.elevationLevel = ElevationLevel.LOW,
    this.itemClickedCallback,
    this.itemLongClickedCallback,
    this.leadingIcon,
    this.leadingType = ThemeGroupType.MOM,
    this.leadingEmphasis = Emphasis.NONE,
    this.leadingIconClickedCallback,
    this.title,
    this.titleType = ThemeGroupType.POM,
    this.titleEmphasis = Emphasis.HIGH,
    this.subtitle,
    this.subtitleType = ThemeGroupType.MOM,
    this.subtitleEmphasis = Emphasis.NONE,
    this.trailingIcon,
    this.trailingType = ThemeGroupType.MOM,
    this.trailingEmphasis = Emphasis.NONE,
    this.trailingIconClickedCallback,
    shadowColor,
    shape,
    borderOnForeground = true,
    margin,
    clipBehavior,
    semanticContainer = true,
  }): super(
    key: key,
    shadowColor: shadowColor,
    shape: shape,
    borderOnForeground: borderOnForeground,
    margin: margin,
    clipBehavior: clipBehavior,
    semanticContainer: semanticContainer,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      color: context.watch<MaterialThemesManager>().getTheme(type).cardTheme.color,
      shadowColor: shadowColor,
      elevation: context.watch<MaterialThemesManager>().getTheme(type, elevationLevel: elevationLevel).cardTheme.elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      child:  ListTile(
        onTap: itemClickedCallback,
        onLongPress: itemLongClickedCallback,
        title: title == null ? null : ThemedTitle(
          title,
          type: titleType,
          emphasis: titleEmphasis,
        ),
        subtitle: subtitle == null ? null : ThemedSubTitle(
          subtitle,
          type: subtitleType,
          emphasis: subtitleEmphasis,
        ),
        leading: leadingIcon == null ? null : ThemedIconButton(
          leadingIcon,
          type: leadingType,
          onPressedCallback: leadingIconClickedCallback,
          emphasis: leadingEmphasis,
        ),
        trailing: trailingIcon == null ? null : ThemedIconButton(
          trailingIcon,
          type: trailingType,
          onPressedCallback: trailingIconClickedCallback,
          emphasis: trailingEmphasis,
        ),
      ),
      semanticContainer: semanticContainer,
    );
  }
}
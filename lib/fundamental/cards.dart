import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

import 'icons.dart';

class ThemedCard extends Card {
  
  final ThemeGroupType type;
  
  ThemedCard({
    key,
    this.type = ThemeGroupType.MOM,
    shadowColor,
    elevation,
    shape,
    borderOnForeground = true,
    margin,
    clipBehavior,
    child,
    semanticContainer = true,
  }): super(
    key: key,
    shadowColor: shadowColor,
    elevation: elevation,
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
      elevation: elevation,
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
  final IconData leadingIcon;
  final ThemeGroupType leadingType;
  final String title;
  final ThemeGroupType titleType;
  final String subtitle;
  final ThemeGroupType subtitleType;
  final IconData trailingIcon;
  final ThemeGroupType trailingType;

  ThemedListTileCard({
    key,
    this.type = ThemeGroupType.MOM,
    this.leadingIcon,
    this.leadingType = ThemeGroupType.MOM,
    this.title,
    this.titleType = ThemeGroupType.POM,
    this.subtitle,
    this.subtitleType = ThemeGroupType.MOM,
    this.trailingIcon,
    this.trailingType = ThemeGroupType.MOM,
    shadowColor,
    elevation,
    shape,
    borderOnForeground = true,
    margin,
    clipBehavior,
    semanticContainer = true,
  }): super(
    key: key,
    shadowColor: shadowColor,
    elevation: elevation,
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
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      child:  ListTile(
        title: title == null ? null : ThemedTitle(title, type: titleType),
        subtitle: subtitle == null ? null : ThemedSubTitle(subtitle, type: subtitleType),
        leading: leadingIcon == null ? null : ThemedIcon(leadingIcon, type: leadingType),
        trailing: trailingIcon == null ? null : ThemedIcon(trailingIcon, type: trailingType),
      ),
      semanticContainer: semanticContainer,
    );
  }
}
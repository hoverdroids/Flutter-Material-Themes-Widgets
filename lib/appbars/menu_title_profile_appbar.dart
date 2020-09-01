import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class MenuTitleProfileAppBar extends AppBar {

  final Emphasis titleEmphasis;
  final Function openMenuCallback;
  final Function openProfileCallback;
  final ThemeGroupType leadingType;
  final Emphasis leadingEmphasis;
  final ThemeGroupType trailingType;
  final Emphasis trailingEmphasis;

  MenuTitleProfileAppBar({
    title,
    this.titleEmphasis = Emphasis.HIGH,
    this.openMenuCallback,
    this.openProfileCallback,
    this.leadingType = ThemeGroupType.MOP,
    this.leadingEmphasis = Emphasis.HIGH,
    this.trailingType = ThemeGroupType.MOP,
    this.trailingEmphasis = Emphasis.HIGH
  }) : super(
    backgroundColor: Colors.transparent,
    elevation: 0.0,//TODO
    title: ThemedTitle(
        title,
        type: leadingType,
        emphasis: titleEmphasis),
    centerTitle: true,

    leading: ThemedIconButton(
      Icons.menu,
      type: leadingType,
      emphasis: leadingEmphasis,
      onPressedCallback: openMenuCallback,
    ),
    actions: <Widget>[
      ThemedIconButton(
        Icons.account_circle,
        type: trailingType,
        emphasis: trailingEmphasis,
        onPressedCallback: openProfileCallback,
      ),
    ],
  );
}
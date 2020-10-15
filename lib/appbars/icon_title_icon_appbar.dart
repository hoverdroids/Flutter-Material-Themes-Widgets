import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class IconTitleIconAppBar extends AppBar {

  final IconData leftIcon;
  final bool showLeftIcon;
  final Function leftIconClickedCallback;
  final ThemeGroupType leftIconType;
  final Emphasis leftIconEmphasis;

  final bool showTitle;
  final Function titleClickedCallback;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;

  final IconData rightIcon;
  final bool showRightIcon;
  final Function rightIconClickedCallback;
  final ThemeGroupType rightIconType;
  final Emphasis rightIconEmphasis;

  IconTitleIconAppBar({
    this.leftIcon = Icons.menu,
    this.showLeftIcon = true,
    this.leftIconClickedCallback,
    this.leftIconType = ThemeGroupType.MOM,
    this.leftIconEmphasis = Emphasis.HIGH,
    title,
    this.showTitle = true,
    this.titleClickedCallback,
    this.titleType = ThemeGroupType.MOM,
    this.titleEmphasis = Emphasis.HIGH,
    this.rightIcon = Icons.account_circle,
    this.showRightIcon = true,
    this.rightIconClickedCallback,
    this.rightIconType = ThemeGroupType.MOM,
    this.rightIconEmphasis = Emphasis.HIGH,
    backgroundColor,
    elevation
  }) : super(
    backgroundColor: backgroundColor != null ? backgroundColor : Colors.transparent,
    elevation: elevation != null ? elevation : 0.0,
    leading: !showLeftIcon ? Container() : ThemedIconButton(
      leftIcon,
      type: leftIconType,
      emphasis: leftIconEmphasis,
      onPressedCallback: leftIconClickedCallback,
    ),
    title: !showTitle ? Container() : ThemedTitle(
      title,
      type: titleType,
      emphasis: titleEmphasis,
      //TODO - onTapTitle
    ),
    centerTitle: true,
    actions: <Widget>[
      ThemedIconButton(
        rightIcon,
        type: rightIconType,
        emphasis: rightIconEmphasis,
        onPressedCallback: rightIconClickedCallback,
      ),
    ],
  );
}
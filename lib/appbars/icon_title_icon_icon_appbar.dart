import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class IconTitleIconIconAppBar extends AppBar {

  final IconData leftIcon;
  final bool showLeftIcon;
  final VoidCallback? leftIconClickedCallback;
  final ThemeGroupType leftIconType;
  final Emphasis leftIconEmphasis;

  final bool showTitle;
  final VoidCallback? titleClickedCallback;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;

  final IconData rightIcon;
  final bool showRightIcon;
  final VoidCallback? rightIconClickedCallback;
  final ThemeGroupType rightIconType;
  final Emphasis rightIconEmphasis;

  final IconData rightIcon2;
  final bool showRightIcon2;
  final VoidCallback? rightIcon2ClickedCallback;
  final ThemeGroupType rightIcon2Type;
  final Emphasis rightIcon2Emphasis;

  IconTitleIconIconAppBar({
    super.key,
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
    this.rightIcon2 = Icons.account_circle,
    this.showRightIcon2 = true,
    this.rightIcon2ClickedCallback,
    this.rightIcon2Type = ThemeGroupType.MOM,
    this.rightIcon2Emphasis = Emphasis.HIGH,
    backgroundColor,
    elevation
  }) : super(
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: elevation ?? 0.0,
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
        rightIcon2,
        type: rightIcon2Type,
        emphasis: rightIcon2Emphasis,
        onPressedCallback: rightIcon2ClickedCallback,
      ),
      ThemedIconButton(
        rightIcon,
        type: rightIconType,
        emphasis: rightIconEmphasis,
        onPressedCallback: rightIconClickedCallback,
      ),
    ],
  );
}
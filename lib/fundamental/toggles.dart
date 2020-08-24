import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedSwitch extends StatelessWidget {

  final ThemeGroupType type;
  final Key key;
  final bool value;
  final onChanged;
  //final activeColor;
  final activeTrackColor;
  final inactiveThumbColor;
  final inactiveTrackColor;
  final activeThumbImage;
  final onActiveThumbImageError;
  final inactiveThumbImage;
  final onInactiveThumbImageError;
  final materialTapTargetSize;
  final dragStartBehavior;
  final mouseCursor;
  final focusColor;
  final hoverColor;
  final focusNode;
  final autofocus;

  ThemedSwitch({
    this.key,
    @required this.value,
    @required this.onChanged,
    this.type = ThemeGroupType.MOM,
    //this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.materialTapTargetSize,
    this.dragStartBehavior,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus});

  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialThemesManager> (
        builder: (context, themeManager, child) {
          //Construct a default widget in order to fall back on default values when the optional params aren't passed
          var defaultSwitch = Switch(value: value, onChanged: onChanged);

          return Switch(
            key: key != null ? key : defaultSwitch.key,
            value: value,
            onChanged: onChanged,
            activeColor: themeManager.getTheme(type).toggleableActiveColor,
            activeTrackColor: activeTrackColor != null ? activeTrackColor : defaultSwitch.activeTrackColor,
            inactiveThumbColor: inactiveThumbColor != null ? inactiveThumbColor : defaultSwitch.inactiveThumbColor,
            inactiveTrackColor: inactiveTrackColor != null ? inactiveTrackColor : defaultSwitch.inactiveTrackColor,
            activeThumbImage: activeThumbImage != null ? activeThumbImage : defaultSwitch.activeThumbImage,
            onActiveThumbImageError: onActiveThumbImageError != null ? onActiveThumbImageError : defaultSwitch.onActiveThumbImageError,
            inactiveThumbImage: inactiveThumbImage != null ? inactiveThumbImage : defaultSwitch.inactiveThumbImage,
            onInactiveThumbImageError: onInactiveThumbImageError != null ? onInactiveThumbImageError : defaultSwitch.onInactiveThumbImageError,
            materialTapTargetSize: materialTapTargetSize != null ? materialTapTargetSize : defaultSwitch.materialTapTargetSize,
            dragStartBehavior: dragStartBehavior != null ? dragStartBehavior : defaultSwitch.dragStartBehavior,
            mouseCursor: mouseCursor != null ? mouseCursor : defaultSwitch.mouseCursor,
            focusColor: focusColor != null ? focusColor : defaultSwitch.focusColor,
            hoverColor: hoverColor != null ? hoverColor : defaultSwitch.hoverColor,
            focusNode: focusNode != null ? focusNode : defaultSwitch.focusNode,
            autofocus: autofocus != null ? autofocus : defaultSwitch.autofocus,
          );
        }
    );
  }
}
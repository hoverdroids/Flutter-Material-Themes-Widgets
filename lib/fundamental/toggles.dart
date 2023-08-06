import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedSwitch extends StatelessWidget {

  final ThemeGroupType type;
  final Key? key;
  final bool value;
  final ValueChanged<bool>? onChanged;
  //final activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider<Object>? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior? dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autofocus;

  ThemedSwitch({
    this.key,
    required this.value,
    required this.onChanged,
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
            key: key ?? defaultSwitch.key,
            value: value,
            onChanged: onChanged,
            activeColor: themeManager.getTheme(type).toggleableActiveColor,
            activeTrackColor: activeTrackColor ?? defaultSwitch.activeTrackColor,
            inactiveThumbColor: inactiveThumbColor ?? defaultSwitch.inactiveThumbColor,
            inactiveTrackColor: inactiveTrackColor ?? defaultSwitch.inactiveTrackColor,
            activeThumbImage: activeThumbImage ?? defaultSwitch.activeThumbImage,
            onActiveThumbImageError: onActiveThumbImageError ?? defaultSwitch.onActiveThumbImageError,
            inactiveThumbImage: inactiveThumbImage ?? defaultSwitch.inactiveThumbImage,
            onInactiveThumbImageError: onInactiveThumbImageError ?? defaultSwitch.onInactiveThumbImageError,
            materialTapTargetSize: materialTapTargetSize ?? defaultSwitch.materialTapTargetSize,
            dragStartBehavior: dragStartBehavior ?? defaultSwitch.dragStartBehavior,
            mouseCursor: mouseCursor ?? defaultSwitch.mouseCursor,
            focusColor: focusColor ?? defaultSwitch.focusColor,
            hoverColor: hoverColor ?? defaultSwitch.hoverColor,
            focusNode: focusNode ?? defaultSwitch.focusNode,
            autofocus: autofocus ?? defaultSwitch.autofocus,
          );
        }
    );
  }
}
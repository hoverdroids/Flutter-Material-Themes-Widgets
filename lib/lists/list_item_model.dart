import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';

class ListItemModel {

  VoidCallback? itemClickedCallback;
  VoidCallback? itemLongClickedCallback;
  IconData? leadingIcon;
  VoidCallback? leadingIconClickedCallback;
  String? title;
  String? subtitle;
  IconData? trailingIcon;
  VoidCallback? trailingIconClickedCallback;

  ThemeGroupType? cardType;
  ElevationLevel? elevationLevel;
  ThemeGroupType? leadingIconType;
  Emphasis? leadingEmphasis;
  ThemeGroupType? titleType;
  Emphasis? titleEmphasis;
  ThemeGroupType? subtitleType;
  Emphasis? subtitleEmphasis;
  ThemeGroupType? trailingIconType;
  Emphasis? trailingEmphasis;
  EdgeInsetsGeometry? margin;

  ListItemModel({
    this.itemClickedCallback,
    this.itemLongClickedCallback,
    this.leadingIcon,
    this.leadingIconClickedCallback,
    this.title,
    this.subtitle,
    this.trailingIcon,
    this.trailingIconClickedCallback,
    this.cardType,
    this.elevationLevel,
    this.leadingIconType,
    this.leadingEmphasis,
    this.titleType,
    this.titleEmphasis,
    this.subtitleType,
    this.subtitleEmphasis,
    this.trailingIconType,
    this.trailingEmphasis,
    this.margin
  });
}
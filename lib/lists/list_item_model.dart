import 'package:flutter/material.dart';

class ListItemModel {

  VoidCallback? itemClickedCallback;
  VoidCallback? itemLongClickedCallback;
  IconData? leadingIcon;
  VoidCallback? leadingIconClickedCallback;
  String? title;
  String? subtitle;
  IconData? trailingIcon;
  VoidCallback? trailingIconClickedCallback;

  ListItemModel({
    this.itemClickedCallback,
    this.itemLongClickedCallback,
    this.leadingIcon,
    this.leadingIconClickedCallback,
    this.title,
    this.subtitle,
    this.trailingIcon,
    this.trailingIconClickedCallback
  });
}
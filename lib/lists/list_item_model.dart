import 'package:flutter/material.dart';

class ListItemModel {

  Function itemClickedCallback;
  Function itemLongClickedCallback;
  IconData leadingIcon;
  Function leadingIconClickedCallback;
  String title;
  String subtitle;
  IconData trailingIcon;
  Function trailingIconClickedCallback;

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
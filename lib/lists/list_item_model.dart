import 'package:flutter/material.dart';

class ListItemModel {
  String text;
  IconData icon;
  Function itemClickedCallback;

  ListItemModel({this.text, this.icon, this.itemClickedCallback});
}
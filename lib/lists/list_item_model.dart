import 'package:flutter/material.dart';

class ListItemModel {
  String text;
  IconData icon;
  Function iconClickedCallback;

  ListItemModel(this.text, this.icon, {this.iconClickedCallback});
}
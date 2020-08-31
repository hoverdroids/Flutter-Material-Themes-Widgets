import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

//TODO - better generalize this
class ThemedCheckbox extends StatefulWidget {
  final String text;

  ThemedCheckbox({this.text});

  _ThemedCheckboxState createState() => _ThemedCheckboxState(text: text);
}

class _ThemedCheckboxState extends State<ThemedCheckbox> {

  bool _isChecked = false;
  final String text;

  _ThemedCheckboxState({this.text});

  @override
  Widget build(BuildContext context) {

    var children = <Widget>[];
    children.add(_buildCheckBox(context));

    //if (text != null) {
      children.add(ThemedSubTitle2(text, type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH));
    //}

    return Container(
      height: 20.0,
      child: Row(
        children: children
      ),
    );
  }

  Widget _buildCheckBox(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white),//TODO - generalize theme into ThemeManager
      child: Checkbox(
        value: _isChecked,
        checkColor: Colors.green,
        activeColor: Colors.white,
        onChanged: (value) {
          setState(() {
            _isChecked = value;
          });
        },
      ),
    );
  }

}
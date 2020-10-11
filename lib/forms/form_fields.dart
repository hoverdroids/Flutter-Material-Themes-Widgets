import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

//TODO - clean this up and make it much easier to provide a simple theme field
class ThemedEmailEntry extends StatelessWidget {

  final bool showLabel;
  final bool showForgotEmail;
  final Function onTapForgotEmail;
  final ThemeGroupType labelType;
  final ThemeGroupType textFieldBackgroundType;

  ThemedEmailEntry({
    this.showLabel = true,
    this.showForgotEmail = true,
    this.onTapForgotEmail,
    this.labelType = ThemeGroupType.MOP,
    this.textFieldBackgroundType = ThemeGroupType.MOM,
  }) : super();

  @override
  Widget build(BuildContext context) {

    var children = <Widget>[];
    if (showLabel) {
      children.add(ThemedSubTitle2('Email', type: labelType, emphasis: Emphasis.HIGH));
      children.add(miniTransparentDivider);
    }
    children.add(_buildEditText(context));
    if (showForgotEmail) {
      children.add(_buildForgotEmail(context));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  //TODO - make a themedButton with no emphasis that doesn't include the container - which is here to justify right
  Widget _buildForgotEmail(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: onTapForgotEmail != null ? onTapForgotEmail : () => print("Tapping forgot email"),
        padding: EdgeInsets.only(right: 0.0),
        child: ThemedSubTitle2('Forgot Email?', type: labelType, emphasis: Emphasis.HIGH),
      ),
    );
  }

  Widget _buildEditText(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
        color: context.watch<MaterialThemesManager>().getTheme(textFieldBackgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
        borderRadius: BorderRadius.circular(largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        decoration: InputDecoration(
          border: InputBorder.none,//hide the bottom EditText underscore bar
          contentPadding: EdgeInsets.only(top: paddingSmall),
          prefixIcon: ThemedIcon(Icons.email, type:ThemeGroupType.MOM),
          hintText: 'Email',
          hintStyle: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        ),
      ),
    );
  }
}

//TODO - clean this up and make it much easier to provide a simple theme field
class ThemedPasswordEntry extends StatelessWidget {

  final bool showLabel;
  final bool showForgotPassword;
  final Function onTapForgotPassword;
  final ThemeGroupType labelType;
  final ThemeGroupType textFieldBackgroundType;

  ThemedPasswordEntry({
    this.showLabel = true,
    this.showForgotPassword = true,
    this.onTapForgotPassword,
    this.labelType = ThemeGroupType.MOP,
    this.textFieldBackgroundType = ThemeGroupType.MOM,
  }) : super();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(showLabel) ... [
          ThemedSubTitle2('Password', type: labelType, emphasis: Emphasis.HIGH),
          miniTransparentDivider
        ],
        _buildEditText(context),
        if(showForgotPassword) ... [
          _buildForgotPassword(context)
        ]
      ],
    );
  }

  //TODO - make a themedButton with no emphasis that doesn't include the container - which is here to justify right
  Widget _buildForgotPassword(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: onTapForgotPassword != null ? onTapForgotPassword : () => print("Tapping forgot password"),
        padding: EdgeInsets.only(right: 0.0),
        child: ThemedSubTitle2('Forgot Password?', type: labelType, emphasis: Emphasis.HIGH),
      ),
    );
  }

  Widget _buildEditText(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
        color: context.watch<MaterialThemesManager>().getTheme(textFieldBackgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
        borderRadius: BorderRadius.circular(largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        style: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        decoration: InputDecoration(
          //TODO - hide password as we type
          border: InputBorder.none,//hide the bottom EditText underscore bar
          contentPadding: EdgeInsets.only(top: paddingSmall),
          prefixIcon: ThemedIcon(Icons.lock, type:ThemeGroupType.MOM),
          hintText: 'Password',
          hintStyle: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        ),
      ),
    );
  }
}

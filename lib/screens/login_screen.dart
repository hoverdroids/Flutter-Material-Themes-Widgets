import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class LoginScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;

  LoginScreen({this.showLabels = true, this.showForgots = true});

  @override
  _LoginScreenState createState() => _LoginScreenState(showLabels: showLabels, showForgots: showForgots);
}

class _LoginScreenState extends State<LoginScreen> {

  final bool showLabels;
  final bool showForgots;

  _LoginScreenState({this.showLabels = true, this.showForgots = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingLarge,
                  vertical: paddingLarge
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ThemedH4("Sign In", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
                    //largeTransparentDivider,
                    ThemedEmailEntry(showLabel: showLabels, showForgotEmail: showForgots),
                    //mediumTransparentDivider,//TODO - make the dividers conditional on showLabel (if showLable, don't add divider)
                    ThemedPasswordEntry(showLabel: showLabels, showForgotPassword: showForgots)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
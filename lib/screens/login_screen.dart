import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class LoginScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;
  final Function onTapRegister;

  LoginScreen({this.showLabels = true, this.showForgots = true, this.onTapRegister});

  @override
  _LoginScreenState createState() => _LoginScreenState(showLabels: showLabels, showForgots: showForgots);
}

class _LoginScreenState extends State<LoginScreen> {

  final bool showLabels;
  final bool showForgots;
  final Function onTapRegister;
  final Function onTapLogin;

  _LoginScreenState({this.showLabels = true, this.showForgots = true, this.onTapRegister, this.onTapLogin});

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
                    ThemedPasswordEntry(showLabel: showLabels, showForgotPassword: showForgots),
                    //ThemedCheckbox(text: "Remeber me")
                    //TODO - look back at PikaJo and get the social media icons
                    RaisedButton(
                        color: Colors.white,
                        onPressed: () =>  onTapLogin != null ? onTapLogin : () => print("Tapped Login"),
                        child: ThemedTitle("Login", type: ThemeGroupType.POM)),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: onTapRegister != null ? onTapRegister : () => print("Tapped Register"),
                        padding: EdgeInsets.only(top: 20.0),
                        child: ThemedSubTitle2("Register", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
                        shape: StadiumBorder(),
                      ),
                    )
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
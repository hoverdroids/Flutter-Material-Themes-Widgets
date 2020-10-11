import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class LoginScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final ValueChanged<String> onPasswordChangedCallback;
  final Function onTapRegister;
  final Function onTapLogin;

  LoginScreen({
    this.showLabels = true,
    this.showForgots = true,
    this.onEmailChangedCallback,
    this.onPasswordChangedCallback,
    this.onTapRegister,
    this.onTapLogin
  });

  @override
  _LoginScreenState createState() => _LoginScreenState(
    showLabels,
    showForgots,
    onEmailChangedCallback,
    onPasswordChangedCallback,
    onTapRegister,
    onTapLogin
  );
}

class _LoginScreenState extends State<LoginScreen> {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final ValueChanged<String> onPasswordChangedCallback;
  final Function onTapRegister;
  final Function onTapLogin;

  final _formKey = GlobalKey<FormState>();

  _LoginScreenState(
    this.showLabels,
    this.showForgots,
    this.onEmailChangedCallback,
    this.onPasswordChangedCallback,
    this.onTapRegister,
    this.onTapLogin
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
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
                      if(!showLabels) ... [
                        SizedBox(height: 20.0)
                      ],
                      ThemedEmailEntry(showLabel: showLabels, showForgotEmail: showForgots, onEmailChangedCallback: onEmailChangedCallback),
                      if(!showLabels) ... [
                        SizedBox(height: 20.0)
                      ],
                      ThemedPasswordEntry(showLabel: showLabels, showForgotPassword: showForgots, onPasswordChangedCallback: onPasswordChangedCallback),
                      //ThemedCheckbox(text: "Remeber me")
                      //TODO - look back at PikaJo and get the social media icons
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () async {
                          if(_formKey.currentState.validate() && onTapLogin != null) {
                            onTapLogin.call();
                          } else if(_formKey.currentState.validate() && onTapLogin == null) {
                            print("Tapped Login");
                          }
                        },
                        child: ThemedTitle("Login", type: ThemeGroupType.POM),
                        shape: StadiumBorder(),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: onTapRegister != null ? onTapRegister : () => print("Tapped Register"),
                          child: ThemedSubTitle2("Register", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
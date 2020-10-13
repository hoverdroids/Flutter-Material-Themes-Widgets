import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class ProfileScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final ValueChanged<String> onPasswordChangedCallback;
  final ValueChanged<String> onFirstNameChangedCallback;
  final ValueChanged<String> onLastNameChangedCallback;
  final ValueChanged<String> onPronounsChangedCallback;
  final ValueChanged<String> onOrganizationChangedCallback;
  final ValueChanged<String> onAddressChangedCallback;
  final ValueChanged<String> onCityChangedCallback;
  final ValueChanged<String> onStateChangedCallback;
  final ValueChanged<String> onZipChangedCallback;
  final Function onTapRegister;
  final Function onTapLogin;
  final String screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;

  ProfileScreen({
    this.showLabels = true,
    this.showForgots = true,
    this.onEmailChangedCallback,
    this.onPasswordChangedCallback,
    this.onFirstNameChangedCallback,
    this.onLastNameChangedCallback,
    this.onPronounsChangedCallback,
    this.onOrganizationChangedCallback,
    this.onAddressChangedCallback,
    this.onCityChangedCallback,
    this.onStateChangedCallback,
    this.onZipChangedCallback,
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle = "Register",
    this.doShowLoginRegisterButtons = true,
    this.padding
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState(
    showLabels,
    showForgots,
    onEmailChangedCallback,
    onPasswordChangedCallback,
    onFirstNameChangedCallback,
    onLastNameChangedCallback,
    onPronounsChangedCallback,
    onOrganizationChangedCallback,
    onAddressChangedCallback,
    onCityChangedCallback,
    onStateChangedCallback,
    onZipChangedCallback,
    onTapRegister,
    onTapLogin,
    screenTitle,
    doShowLoginRegisterButtons,
    padding
  );
}

class _ProfileScreenState extends State<ProfileScreen> {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final ValueChanged<String> onPasswordChangedCallback;
  final ValueChanged<String> onFirstNameChangedCallback;
  final ValueChanged<String> onLastNameChangedCallback;
  final ValueChanged<String> onPronounsChangedCallback;
  final ValueChanged<String> onOrganizationChangedCallback;
  final ValueChanged<String> onAddressChangedCallback;
  final ValueChanged<String> onCityChangedCallback;
  final ValueChanged<String> onStateChangedCallback;
  final ValueChanged<String> onZipChangedCallback;
  final Function onTapRegister;
  final Function onTapLogin;
  final String screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;

  final _formKey = GlobalKey<FormState>();

  _ProfileScreenState(
    this.showLabels,
    this.showForgots,
    this.onEmailChangedCallback,
    this.onPasswordChangedCallback,
    this.onFirstNameChangedCallback,
    this.onLastNameChangedCallback,
    this.onPronounsChangedCallback,
    this.onOrganizationChangedCallback,
    this.onAddressChangedCallback,
    this.onCityChangedCallback,
    this.onStateChangedCallback,
    this.onZipChangedCallback,
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle,
    this.doShowLoginRegisterButtons,
    this.padding
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: padding != null ? padding : EdgeInsets.all(paddingMini),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ThemedH4(screenTitle, type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
                        if(!showLabels) ... [
                          SizedBox(height: 20.0)
                        ],
                        ThemedEmailEntry(showLabel: showLabels, showForgotEmail: showForgots, onEmailChangedCallback: onEmailChangedCallback),
                        if(!showLabels) ... [
                          SizedBox(height: 20.0)
                        ],
                        ThemedPasswordEntry(showLabel: showLabels, showForgotPassword: showForgots, onPasswordChangedCallback: onPasswordChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "First Name", onStringChangedCallback: onFirstNameChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "Last Name", onStringChangedCallback: onLastNameChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "Pronouns", onStringChangedCallback: onPronounsChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "Organization", onStringChangedCallback: onOrganizationChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "Address", onStringChangedCallback: onAddressChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "City", onStringChangedCallback: onCityChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "State", onStringChangedCallback: onStateChangedCallback),
                        miniTransparentDivider,
                        ThemedStringEntry(hintText: "Zip", onStringChangedCallback: onZipChangedCallback),
                        //TODO - look back at PikaJo and get the social media icons
                        if(doShowLoginRegisterButtons) ... [
                          mediumTransparentDivider,
                          RaisedButton(
                            color: Colors.white,
                            onPressed: () async {
                              if(_formKey.currentState.validate() && onTapRegister != null) {
                                onTapRegister.call();
                              } else if(_formKey.currentState.validate() && onTapRegister == null) {
                                print("Tapped Register");
                              }
                            },
                            child: ThemedTitle("Register", type: ThemeGroupType.POM),
                            shape: StadiumBorder(),
                          ),
                          mediumTransparentDivider,
                          Container(
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: onTapLogin != null ? onTapLogin : () => print("Tapped Login"),
                              child: ThemedSubTitle2("Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
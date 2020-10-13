import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class LoginRegisterScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final bool showEmail;
  final ValueChanged<String> onPasswordChangedCallback;
  final bool showPassword;
  final ValueChanged<String> onFirstNameChangedCallback;
  final bool showFirstName;
  final ValueChanged<String> onLastNameChangedCallback;
  final bool showLastName;
  final ValueChanged<String> onPronounsChangedCallback;
  final bool showPronouns;
  final ValueChanged<String> onOrganizationChangedCallback;
  final bool showOrganization;
  final ValueChanged<String> onAddressChangedCallback;
  final bool showAddress;
  final ValueChanged<String> onCityChangedCallback;
  final bool showCity;
  final ValueChanged<String> onStateChangedCallback;
  final bool showState;
  final ValueChanged<String> onZipChangedCallback;
  final bool showZip;
  final Function onTapRegister;
  final Function onTapLogin;
  final String screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;
  final bool isHeaderSticky;
  final bool isFooterSticky;
  final bool isFooterVertical;
  final EdgeInsets headerPadding;
  final bool centerForm;

  LoginRegisterScreen({
    this.showLabels = true,
    this.showForgots = true,
    this.onEmailChangedCallback,
    this.showEmail = true,
    this.onPasswordChangedCallback,
    this.showPassword = true,
    this.onFirstNameChangedCallback,
    this.showFirstName = true,
    this.onLastNameChangedCallback,
    this.showLastName = true,
    this.onPronounsChangedCallback,
    this.showPronouns = true,
    this.onOrganizationChangedCallback,
    this.showOrganization = true,
    this.onAddressChangedCallback,
    this.showAddress = true,
    this.onCityChangedCallback,
    this.showCity = true,
    this.onStateChangedCallback,
    this.showState = true,
    this.onZipChangedCallback,
    this.showZip = true,
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle = "Register",
    this.doShowLoginRegisterButtons = true,
    this.padding = const EdgeInsets.fromLTRB(paddingMini, 0.0, paddingMini, paddingMini),
    this.isHeaderSticky = false,
    this.isFooterSticky = false,
    this.isFooterVertical = true,
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true
  });

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState(
    showLabels,
    showForgots,
    onEmailChangedCallback,
    showEmail,
    onPasswordChangedCallback,
    showPassword,
    onFirstNameChangedCallback,
    showFirstName,
    onLastNameChangedCallback,
    showLastName,
    onPronounsChangedCallback,
    showPronouns,
    onOrganizationChangedCallback,
    showOrganization,
    onAddressChangedCallback,
    showAddress,
    onCityChangedCallback,
    showCity,
    onStateChangedCallback,
    showState,
    onZipChangedCallback,
    showZip,
    onTapRegister,
    onTapLogin,
    screenTitle,
    doShowLoginRegisterButtons,
    padding,
    isHeaderSticky,
    isFooterSticky,
    isFooterVertical,
    headerPadding,
    centerForm
  );
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  final bool showEmail;
  final ValueChanged<String> onPasswordChangedCallback;
  final bool showPassword;
  final ValueChanged<String> onFirstNameChangedCallback;
  final bool showFirstName;
  final ValueChanged<String> onLastNameChangedCallback;
  final bool showLastName;
  final ValueChanged<String> onPronounsChangedCallback;
  final bool showPronouns;
  final ValueChanged<String> onOrganizationChangedCallback;
  final bool showOrganization;
  final ValueChanged<String> onAddressChangedCallback;
  final bool showAddress;
  final ValueChanged<String> onCityChangedCallback;
  final bool showCity;
  final ValueChanged<String> onStateChangedCallback;
  final bool showState;
  final ValueChanged<String> onZipChangedCallback;
  final bool showZip;
  final Function onTapRegister;
  final Function onTapLogin;
  final String screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;
  final bool isHeaderSticky;
  final bool isFooterSticky;
  final bool isFooterVertical;
  final EdgeInsets headerPadding;
  final bool centerForm;

  final _formKey = GlobalKey<FormState>();

  _LoginRegisterScreenState(
    this.showLabels,
    this.showForgots,
    this.onEmailChangedCallback,
    this.showEmail,
    this.onPasswordChangedCallback,
    this.showPassword,
    this.onFirstNameChangedCallback,
    this.showFirstName,
    this.onLastNameChangedCallback,
    this.showLastName,
    this.onPronounsChangedCallback,
    this.showPronouns,
    this.onOrganizationChangedCallback,
    this.showOrganization,
    this.onAddressChangedCallback,
    this.showAddress,
    this.onCityChangedCallback,
    this.showCity,
    this.onStateChangedCallback,
    this.showState,
    this.onZipChangedCallback,
    this.showZip,
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle,
    this.doShowLoginRegisterButtons,
    this.padding,
    this.isHeaderSticky,
    this.isFooterSticky,
    this.isFooterVertical,
    this.headerPadding,
    this.centerForm
  );

  Widget _buildContent() {
    return Container(
      child: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: centerForm ? Center(child: _buildScrollView()) : _buildScrollView(),
        ),
      ),
    );
  }

  Widget _buildScrollView() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: padding,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(!isHeaderSticky) ... [ _buildHeader() ],
                  smallTransparentDivider,
                  if (showEmail) ... [
                    ThemedStringEntry(hintText: "Email", onStringChangedCallback: onEmailChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    ThemedStringEntry(hintText: "Password", onStringChangedCallback: onPasswordChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    ThemedStringEntry(hintText: "First Name", onStringChangedCallback: onFirstNameChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    ThemedStringEntry(hintText: "Last Name", onStringChangedCallback: onLastNameChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPronouns) ... [
                    ThemedStringEntry(hintText: "Pronouns", onStringChangedCallback: onPronounsChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showOrganization) ... [
                    ThemedStringEntry(hintText: "Organization", onStringChangedCallback: onOrganizationChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showAddress) ... [
                    ThemedStringEntry(hintText: "Address", onStringChangedCallback: onAddressChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showCity) ... [
                    ThemedStringEntry(hintText: "City", onStringChangedCallback: onCityChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showState) ... [
                    ThemedStringEntry(hintText: "State", onStringChangedCallback: onStateChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showZip) ... [
                    ThemedStringEntry(hintText: "Zip", onStringChangedCallback: onZipChangedCallback),
                    smallTransparentDivider
                  ],
                  if(doShowLoginRegisterButtons && !isFooterSticky && isFooterVertical) ... [ _buildVerticalFooter()]
                  else if (doShowLoginRegisterButtons && !isFooterSticky && !isFooterVertical) ... [ _buildHorizontalFooter() ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: headerPadding,
      child:ThemedH4(screenTitle, type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH)
    );
  }

  Widget _buildHorizontalFooter() {
    return Row(children: <Widget>[
      smallTransparentDivider,
      Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: onTapLogin != null ? onTapLogin : () => print("Tapped Login"),
              child: ThemedSubTitle2("Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
            ),
          )
      ),
      Flexible(
        flex: 1,
        child: RaisedButton(
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
      )
    ]);
  }

  Widget _buildVerticalFooter() {
    return Column(children: <Widget>[
      smallTransparentDivider,
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
      smallTransparentDivider,
      Container(
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: onTapLogin != null ? onTapLogin : () => print("Tapped Login"),
          child: ThemedSubTitle2("Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
        ),
      )
    ]);
  }

  Widget _buildStickyForm() {
    return Column(
      children: <Widget>[
        if (isHeaderSticky) ... [ _buildHeader() ],
        Flexible(
          flex: 1,
          child:_buildContent()),
        if(doShowLoginRegisterButtons && isFooterSticky) ... [
          smallTransparentDivider,
          if (isFooterVertical) ... [_buildVerticalFooter()]
          else ... [_buildHorizontalFooter()]
        ],
      ]
    );
  }

  Widget _buildForm() {
    return _buildContent();
  }

  @override
  Widget build(BuildContext context) {
    return isHeaderSticky ? _buildStickyForm() : _buildForm();
  }
}
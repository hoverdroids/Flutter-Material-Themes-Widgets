import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class LoginRegisterScreen extends StatefulWidget {

  final bool showLabels;
  final bool showForgots;
  final ValueChanged<String> onEmailChangedCallback;
  bool showEmail;
  final ValueChanged<String> onPasswordChangedCallback;
  bool showPassword;
  final ValueChanged<String> onFirstNameChangedCallback;
  bool showFirstName;
  final ValueChanged<String> onLastNameChangedCallback;
  bool showLastName;
  final ValueChanged<String> onTaglineChangedCallback;
  bool showTagline;
  final ValueChanged<String> onPronounsChangedCallback;
  bool showPronouns;
  final ValueChanged<String> onOrganizationChangedCallback;
  bool showOrganization;
  final ValueChanged<String> onAddressChangedCallback;
  bool showAddress;
  final ValueChanged<String> onCityChangedCallback;
  bool showCity;
  final ValueChanged<String> onStateChangedCallback;
  bool showState;
  final ValueChanged<String> onZipChangedCallback;
  bool showZip;
  final Function onTapRegister;
  final Function onTapLogin;
  final String screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;
  final bool isHeaderSticky;
  final bool isFooterSticky;
  final bool isFooterVertical;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;
  final bool centerForm;
  final bool isLogin;

  LoginRegisterScreen({
    this.showLabels = true,
    this.showForgots = true,
    this.onEmailChangedCallback,
    this.showEmail,
    this.onPasswordChangedCallback,
    this.showPassword,
    this.onFirstNameChangedCallback,
    this.showFirstName,
    this.onLastNameChangedCallback,
    this.showLastName,
    this.onTaglineChangedCallback,
    this.showTagline,
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
    this.doShowLoginRegisterButtons = true,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0, horizontal: paddingMini),
    this.isHeaderSticky = false,
    this.isFooterSticky = false,
    this.isFooterVertical = true,
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.footerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true,
    this.isLogin = true
  }): super() {
    if (showEmail == null) showEmail = true;
    if (showPassword == null) showPassword = true;
    if (showFirstName == null) showFirstName = isLogin ? false : true;
    if (showLastName == null) showLastName = isLogin ? false : true;
    if (showTagline == null) showTagline = isLogin ? false : true;
    if (showPronouns == null) showPronouns = isLogin ? false : true;
    if (showOrganization == null) showOrganization = isLogin ? false : true;
    if (showAddress == null) showAddress = isLogin ? false : true;
    if (showCity == null) showCity = isLogin ? false : true;
    if (showState == null) showState = isLogin ? false : true;
    if (showZip == null) showZip = isLogin ? false : true;
  }

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
    onTaglineChangedCallback,
    showTagline,
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
    footerPadding,
    centerForm,
    isLogin
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
  final ValueChanged<String> onTaglineChangedCallback;
  final bool showTagline;
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
  final EdgeInsets footerPadding;
  final bool centerForm;
  final bool isLogin;

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
    this.onTaglineChangedCallback,
    this.showTagline,
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
    this.footerPadding,
    this.centerForm,
    this.isLogin
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
                    ThemedStringEntry(labelText: "Email", onStringChangedCallback: onEmailChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    ThemedStringEntry(labelText: "Password", onStringChangedCallback: onPasswordChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    ThemedStringEntry(labelText: "First Name", onStringChangedCallback: onFirstNameChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    ThemedStringEntry(labelText: "Last Name", onStringChangedCallback: onLastNameChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showTagline) ... [
                    ThemedStringEntry(labelText: "Tagline", hintText: "e.g. Adventurer", onStringChangedCallback: onTaglineChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPronouns) ... [
                    ThemedStringEntry(labelText: "Pronouns", onStringChangedCallback: onPronounsChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showOrganization) ... [
                    ThemedStringEntry(labelText: "Organization", onStringChangedCallback: onOrganizationChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showAddress) ... [
                    ThemedStringEntry(labelText: "Address", onStringChangedCallback: onAddressChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showCity) ... [
                    ThemedStringEntry(labelText: "City", onStringChangedCallback: onCityChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showState) ... [
                    ThemedStringEntry(labelText: "State", onStringChangedCallback: onStateChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showZip) ... [
                    ThemedStringEntry(labelText: "Zip", onStringChangedCallback: onZipChangedCallback),
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
    var loginRegTitle = isLogin ? "Login" : "Register";
    var title = screenTitle != null ? screenTitle : loginRegTitle;
    return Padding(
      padding: headerPadding,
      child:ThemedH4(title, type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH)
    );
  }

  Widget _buildHorizontalFooter() {
    return Padding(
      padding: footerPadding,
      child: Row(children: <Widget>[
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
      ]),
    );
  }

  Widget _buildVerticalFooter() {
    return Padding(
      padding: footerPadding,
      child: Column(children: <Widget>[
        smallTransparentDivider,
        RaisedButton(
          color: Colors.white,
          onPressed: () async {
            var valid = _formKey.currentState.validate();
            if(valid && isLogin && onTapLogin != null) {
              onTapLogin.call();
            } else if(valid && !isLogin && onTapRegister != null) {
              onTapRegister.call();
            }
          },
          child: ThemedTitle(isLogin ? "Login" : "Register", type: ThemeGroupType.POM),
          shape: StadiumBorder(),
        ),
        smallTransparentDivider,
        Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: () => {
              if(isLogin && onTapLogin != null) {
                onTapLogin.call()
              } else if(!isLogin && onTapRegister != null) {
                onTapRegister.call()
              }
            },
            child: ThemedSubTitle2(isLogin ? "Register" : "Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          if (isHeaderSticky) ... [ _buildHeader() ],
          Flexible(
              flex: 1,
              child:_buildContent()),
          if(doShowLoginRegisterButtons && isFooterSticky) ... [
            if (isFooterVertical) ... [_buildVerticalFooter()]
            else ... [_buildHorizontalFooter()]
          ],
        ]
    );
  }
}
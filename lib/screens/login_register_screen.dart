import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/utils/validators.dart';

class LoginRegisterScreen extends StatefulWidget {

  final Key? key;

  final bool showLabels;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  //TODO final TextAlign textAlign;
  final bool obscureText;

  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final ThemeGroupType textFieldBackgroundType;
  final bool showForgots;
  final ValueChanged<String>? onEmailChangedCallback;
  bool showEmail;
  final ValueChanged<String>? onPasswordChangedCallback;
  bool showPassword;
  final ValueChanged<String>? onFirstNameChangedCallback;
  late bool showFirstName;
  final ValueChanged<String>? onLastNameChangedCallback;
  late bool showLastName;
  final ValueChanged<String>? onTaglineChangedCallback;
  late bool showTagline;
  final ValueChanged<String>? onPronounsChangedCallback;
  late bool showPronouns;
  final ValueChanged<String>? onOrganizationChangedCallback;
  late bool showOrganization;
  final ValueChanged<String>? onAddressChangedCallback;
  late bool showAddress;
  final ValueChanged<String>? onCityChangedCallback;
  late bool showCity = true;
  final ValueChanged<String>? onStateChangedCallback;
  late bool showState = true;
  final ValueChanged<String>? onZipChangedCallback;
  late bool showZip = true;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final String? screenTitle;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;
  late bool isHeaderSticky;
  late bool isFooterSticky;
  late bool isFooterVertical;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;
  final bool centerForm;
  final bool isLogin;

  LoginRegisterScreen({
    this.key,
    this.showLabels = true,
    this.labelType = ThemeGroupType.MOP,
    this.labelEmphasis = Emphasis.NONE,
    this.labelTextAlign = TextAlign.start,
    this.prefixIconType = ThemeGroupType.MOM,
    this.prefixIconEmphasis = Emphasis.NONE,
    this.textType = ThemeGroupType.POM,
    this.textEmphasis = Emphasis.HIGH,
    this.obscureText = false,
    this.hintTextType = ThemeGroupType.MOM,
    this.hintTextEmphasis = Emphasis.NONE,
    this.textFieldBackgroundType = ThemeGroupType.MOP,
    this.showForgots = false,
    this.onEmailChangedCallback,
    this.showEmail = true,
    this.onPasswordChangedCallback,
    this.showPassword = true,
    this.onFirstNameChangedCallback,
    bool? showFirstName,
    this.onLastNameChangedCallback,
    bool? showLastName,
    this.onTaglineChangedCallback,
    bool? showTagline,
    this.onPronounsChangedCallback,
    bool? showPronouns,
    this.onOrganizationChangedCallback,
    bool? showOrganization,
    this.onAddressChangedCallback,
    bool? showAddress,
    this.onCityChangedCallback,
    bool? showCity,
    this.onStateChangedCallback,
    bool? showState,
    this.onZipChangedCallback,
    bool? showZip,
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle,
    this.doShowLoginRegisterButtons = true,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0, horizontal: paddingMini),
    bool? isHeaderSticky,
    bool? isFooterSticky,
    bool? isFooterVertical,
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.footerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true,
    this.isLogin = true
  }): super() {
    this.showFirstName = showFirstName ?? isLogin ? false : true;
    this.showLastName = showLastName ?? isLogin ? false : true;
    this.showTagline = showTagline ?? isLogin ? false : true;
    this.showPronouns = showPronouns ?? isLogin ? false : true;
    this.showOrganization = showOrganization ?? isLogin ? false : true;
    this.showAddress = showAddress ?? isLogin ? false : true;
    this.showCity = showCity ?? isLogin ? false : true;
    this.showState = showState ?? isLogin ? false : true;
    this.showZip = showZip ?? isLogin ? false : true;
    this.isHeaderSticky = isHeaderSticky ?? isLogin ? false : true;
    this.isFooterSticky = isFooterSticky ?? isLogin ? false : true;
    this.isFooterVertical = isFooterVertical ?? isLogin ? true : false;
  }

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState(
    key,
    showLabels,
    labelType,
    labelEmphasis,
    labelTextAlign,
    prefixIconType,
    prefixIconEmphasis,
    textType,
    textEmphasis,
    hintTextType,
    hintTextEmphasis,
    textFieldBackgroundType,
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

  final Key? key;

  final bool showLabels;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  //TODO final TextAlign textAlign;

  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final ThemeGroupType textFieldBackgroundType;

  final bool showForgots;
  final ValueChanged<String>? onEmailChangedCallback;
  final bool showEmail;
  final ValueChanged<String>? onPasswordChangedCallback;
  final bool showPassword;
  final ValueChanged<String>? onFirstNameChangedCallback;
  final bool showFirstName;
  final ValueChanged<String>? onLastNameChangedCallback;
  final bool showLastName;
  final ValueChanged<String>? onTaglineChangedCallback;
  final bool showTagline;
  final ValueChanged<String>? onPronounsChangedCallback;
  final bool showPronouns;
  final ValueChanged<String>? onOrganizationChangedCallback;
  final bool showOrganization;
  final ValueChanged<String>? onAddressChangedCallback;
  final bool showAddress;
  final ValueChanged<String>? onCityChangedCallback;
  final bool showCity;
  final ValueChanged<String>? onStateChangedCallback;
  final bool showState;
  final ValueChanged<String>? onZipChangedCallback;
  final bool showZip;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final String? screenTitle;
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
    this.key,
    this.showLabels,
    this.labelType,
    this.labelEmphasis,
    this.labelTextAlign,
    this.prefixIconType,
    this.prefixIconEmphasis,
    this.textType,
    this.textEmphasis,
    this.hintTextType,
    this.hintTextEmphasis,
    this.textFieldBackgroundType,
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

  Widget _buildHeader() {
    var loginRegTitle = isLogin ? "Login" : "Register";
    var title = screenTitle ?? loginRegTitle;
    return Padding(
      padding: headerPadding,
      child:ThemedH4(title, type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH)
    );
  }

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
                    _buildStringEntry(labelText: "Email", hintText: showLabels ? "" : "Email", prefixIcon: showLabels ? null : Icons.email, onStringChangedCallback: onEmailChangedCallback,
                    validator: (value) => emailValidator(value)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringEntry(labelText: "Password", hintText: showLabels ? "" : "Password", prefixIcon: showLabels ? null : Icons.lock, onStringChangedCallback: onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value), obscureText: true
                    ),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    _buildStringEntry(labelText: "First Name", hintText: showLabels ? "" : "First Name", onStringChangedCallback: onFirstNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "First Name")),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    _buildStringEntry(labelText: "Last Name", hintText: showLabels ? "" : "Last Name", onStringChangedCallback: onLastNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Last Name")),
                    smallTransparentDivider
                  ],
                  if (showTagline) ... [
                    _buildStringEntry(labelText: "Tagline", hintText: showLabels ? "e.g. Adventurer" : "Tagline", onStringChangedCallback: onTaglineChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPronouns) ... [
                    _buildStringEntry(labelText: "Pronouns", hintText: showLabels ? "" : "Pronouns", onStringChangedCallback: onPronounsChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showOrganization) ... [
                    _buildStringEntry(labelText: "Organization", hintText: showLabels ? "" : "Organization", onStringChangedCallback: onOrganizationChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showAddress) ... [
                    _buildStringEntry(labelText: "Address", hintText: showLabels ? "" : "Address", onStringChangedCallback: onAddressChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showCity) ... [
                    _buildStringEntry(labelText: "City", hintText: showLabels ? "" : "City", onStringChangedCallback: onCityChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showState) ... [
                    _buildStringEntry(labelText: "State", hintText: showLabels ? "" : "State", onStringChangedCallback: onStateChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showZip) ... [
                    _buildStringEntry(labelText: "Zip", hintText: showLabels ? "" : "Zip", onStringChangedCallback: onZipChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Zip")),
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

  Widget _buildStringEntry({
    String labelText = "",
    IconData? prefixIcon,
    String text = "",
    bool obscureText = false,
    String hintText = "",
    ValueChanged<String>? onStringChangedCallback,
    FormFieldValidator<String>? validator
  }) {

    return ThemedEditableLabelValue(
      showLabel: showLabels,
      labelText: labelText,
      labelType: labelType,
      labelEmphasis: labelEmphasis,
      labelTextAlign: labelTextAlign,
      prefixIcon: prefixIcon,
      prefixIconType: prefixIconType,
      prefixIconEmphasis: prefixIconEmphasis,
      text: text,
      textType: textType,
      textEmphasis: textEmphasis,
      obscureText: obscureText,
      hintText: hintText,
      hintTextType: hintTextType,
      hintTextEmphasis: hintTextEmphasis,
      backgroundType: textFieldBackgroundType,
      onStringChangedCallback: onStringChangedCallback,
      validator: validator
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
                onPressed:  () => {
                  if(!isLogin) {
                    onTapLogin?.call()
                  } else if(isLogin) {
                    onTapRegister?.call()
                  }
                },
                child: ThemedSubTitle2(isLogin ? "Register" : "Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
              ),
            )
        ),
        Flexible(
          flex: 1,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () async {
              var valid = _formKey.currentState?.validate() ?? false;
              if(valid && isLogin) {
                onTapLogin?.call();
              } else if(valid && !isLogin) {
                onTapRegister?.call();
              }
            },
            shape: const StadiumBorder(),
            child: ThemedTitle(isLogin ? "Login" : "Register", type: ThemeGroupType.POM),
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
            var valid = _formKey.currentState?.validate() ?? false;
            if(valid && isLogin && onTapLogin != null) {
              onTapLogin!.call();
            } else if(valid && !isLogin && onTapRegister != null) {
              onTapRegister!.call();
            }
          },
          shape: const StadiumBorder(),
          child: ThemedTitle(isLogin ? "Login" : "Register", type: ThemeGroupType.POM),
        ),
        smallTransparentDivider,
        Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: () => {
              if(!isLogin && onTapLogin != null) {
                onTapLogin!.call()
              } else if(isLogin && onTapRegister != null) {
                onTapRegister!.call()
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
      key: key,
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
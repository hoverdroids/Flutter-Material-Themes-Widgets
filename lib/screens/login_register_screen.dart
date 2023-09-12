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
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final String? screenTitle;
  final EdgeInsets padding;
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
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0, horizontal: paddingMini),
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.footerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true,
    this.isLogin = true
  }): super();

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
    onTapRegister,
    onTapLogin,
    screenTitle,
    padding,
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
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final String? screenTitle;
  final EdgeInsets padding;
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
    this.onTapRegister,
    this.onTapLogin,
    this.screenTitle,
    this.padding,
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
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: centerForm ? Center(child: _buildScrollView()) : _buildScrollView(),
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
                  _buildHeader(),
                  smallTransparentDivider,
                  if (showEmail) ... [
                    _buildStringEntry(labelText: "Email", hintText: showLabels ? "" : "Email", prefixIcon: showLabels ? null : Icons.email, onStringChangedCallback: onEmailChangedCallback,
                    validator: (value) => emailValidator(value, true)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringEntry(labelText: "Password", hintText: showLabels ? "" : "Password", prefixIcon: showLabels ? null : Icons.lock, onStringChangedCallback: onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value, true),
                      obscureText: true
                    ),
                    smallTransparentDivider
                  ],
                   _buildVerticalFooter()
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

  Widget _buildVerticalFooter() {
    return Padding(
      padding: footerPadding,
      child: Column(children: <Widget>[
        smallTransparentDivider,
        ElevatedButton(
          onPressed: () async {
            var valid = _formKey.currentState?.validate() ?? false;
            if(valid && isLogin && onTapLogin != null) {
              onTapLogin!.call();
            } else if(valid && !isLogin && onTapRegister != null) {
              onTapRegister!.call();
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            backgroundColor: Colors.white,
            shape: const StadiumBorder(),
          ),
          child: ThemedTitle(isLogin ? "Login" : "Register", type: ThemeGroupType.POM),
        ),
        smallTransparentDivider,
        Container(
          alignment: Alignment.center,
          child: TextButton(
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
        Flexible(
            flex: 1,
            child:_buildContent()
        ),
      ]
    );
  }
}
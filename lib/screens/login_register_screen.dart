import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/utils/validators.dart';

class LoginRegisterScreen extends StatefulWidget {
  
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
  final bool showEmail;
  final ValueChanged<String>? onPasswordChangedCallback;
  final bool showPassword;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final VoidCallback? onTapForgotPassword;
  final String? screenTitle;
  final EdgeInsets padding;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;
  final bool centerForm;
  final bool isLogin;

  const LoginRegisterScreen({
    super.key,
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
    this.onTapForgotPassword,
    this.screenTitle,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0, horizontal: paddingMini),
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.footerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true,
    this.isLogin = true
  });

  @override
  LoginRegisterScreenState createState() => LoginRegisterScreenState();
}

class LoginRegisterScreenState extends State<LoginRegisterScreen> {

  late Key? key;

  late bool showLabels;
  late ThemeGroupType labelType;
  late Emphasis labelEmphasis;
  late TextAlign labelTextAlign;

  late ThemeGroupType prefixIconType;
  late Emphasis prefixIconEmphasis;

  late ThemeGroupType textType;
  late Emphasis textEmphasis;
  //TODO late TextAlign textAlign;

  late ThemeGroupType hintTextType;
  late Emphasis hintTextEmphasis;
  //TODO late TextAlign hintTextAlign;

  late ThemeGroupType textFieldBackgroundType;

  late bool showForgots;
  late ValueChanged<String>? onEmailChangedCallback;
  late bool showEmail;
  late ValueChanged<String>? onPasswordChangedCallback;
  late bool showPassword;
  late VoidCallback? onTapRegister;
  late VoidCallback? onTapLogin;
  late VoidCallback? onTapForgotPassword;
  late String? screenTitle;
  late EdgeInsets padding;
  late EdgeInsets headerPadding;
  late EdgeInsets footerPadding;
  late bool centerForm;
  late bool isLogin;

  final _formKey = GlobalKey<FormState>();

  LoginRegisterScreenState() {
    key = widget.key;
    showLabels = widget.showLabels;
    labelType = widget.labelType;
    labelEmphasis = widget.labelEmphasis;
    labelTextAlign = widget.labelTextAlign;
    prefixIconType = widget.prefixIconType;
    prefixIconEmphasis = widget.prefixIconEmphasis;
    textType = widget.textType;
    textEmphasis = widget.textEmphasis;
    hintTextType = widget.hintTextType;
    hintTextEmphasis = widget.hintTextEmphasis;
    textFieldBackgroundType = widget.textFieldBackgroundType;
    showForgots = widget.showForgots;
    onEmailChangedCallback = widget.onEmailChangedCallback;
    showEmail = widget.showEmail;
    onPasswordChangedCallback = widget.onPasswordChangedCallback;
    showPassword = widget.showPassword;
    onTapRegister = widget.onTapRegister;
    onTapLogin = widget.onTapLogin;
    onTapForgotPassword = widget.onTapForgotPassword;
    screenTitle = widget.screenTitle;
    padding = widget.padding;
    headerPadding = widget.headerPadding;
    footerPadding = widget.footerPadding;
    centerForm = widget.centerForm;
    isLogin = widget.isLogin;
  }

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
            child: ThemedSubTitle(isLogin ? "Register" : "Login", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
          ),
        ),
        if(isLogin)...[
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => {
                onTapForgotPassword?.call()
              },
              child: ThemedSubTitle("Forgot password", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
            ),
          )
        ]
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
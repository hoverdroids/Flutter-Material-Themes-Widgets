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

  final bool? showIcons;
  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  final TextAlign textAlign;
  final ThemeGroupType textFieldBackgroundType;

  final bool? showHints;
  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final String email;
  final bool showEmail;
  final bool canEditEmail;
  final bool obscureEmail;
  final ValueChanged<String>? onEmailChangedCallback;
  final String emailLabel;
  final bool? showEmailLabel;
  final String emailHint;
  final bool? showEmailHint;
  final IconData? emailIcon;
  final bool? showEmailIcon;

  final String password;
  final bool showPassword;
  final bool canEditPassword;
  final bool obscurePassword;
  final ValueChanged<String>? onPasswordChangedCallback;
  final String passwordLabel;
  final bool? showPasswordLabel;
  final String passwordHint;
  final bool? showPasswordHint;
  final IconData? passwordIcon;
  final bool? showPasswordIcon;

  final bool showForgots;
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

    this.showIcons,
    this.prefixIconType = ThemeGroupType.MOM,
    this.prefixIconEmphasis = Emphasis.NONE,

    this.textType = ThemeGroupType.POM,
    this.textEmphasis = Emphasis.HIGH,
    this.textAlign = TextAlign.start,
    this.textFieldBackgroundType = ThemeGroupType.MOP,

    this.showHints,
    this.hintTextType = ThemeGroupType.MOM,
    this.hintTextEmphasis = Emphasis.NONE,
    // this.hintTextAlign = TextAlign.start,

    this.email = "",
    this.showEmail = true,
    this.canEditEmail = true,
    this.obscureEmail = false,
    this.onEmailChangedCallback,
    this.emailLabel = "Email",
    this.showEmailLabel,
    this.emailHint = "Email",
    this.showEmailHint,
    this.emailIcon = Icons.email,
    this.showEmailIcon,

    this.password = "",
    this.showPassword = true,
    this.canEditPassword = true,
    this.obscurePassword = true,
    this.onPasswordChangedCallback,
    this.passwordLabel = "Password",
    this.showPasswordLabel,
    this.passwordHint = "Password",
    this.showPasswordHint,
    this.passwordIcon = Icons.password,
    this.showPasswordIcon,

    this.showForgots = false,
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

  late bool showIcons;
  late ThemeGroupType prefixIconType;
  late Emphasis prefixIconEmphasis;

  late ThemeGroupType textType;
  late Emphasis textEmphasis;
  late TextAlign textAlign;
  late ThemeGroupType textFieldBackgroundType;

  late bool showHints;
  late ThemeGroupType hintTextType;
  late Emphasis hintTextEmphasis;
  //TODO late TextAlign hintTextAlign;

  late String email;
  late bool showEmail;
  late bool canEditEmail;
  late bool obscureEmail;
  late ValueChanged<String>? onEmailChangedCallback;
  late String emailLabel;
  late bool showEmailLabel;
  late String emailHint;
  late bool showEmailHint;
  late IconData? emailIcon;
  late bool showEmailIcon;

  late String password;
  late bool showPassword;
  late bool canEditPassword;
  late bool obscurePassword;
  late ValueChanged<String>? onPasswordChangedCallback;
  late String passwordLabel;
  late bool showPasswordLabel;
  late String passwordHint;
  late bool showPasswordHint;
  late IconData? passwordIcon;
  late bool showPasswordIcon;

  late bool showForgots;
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

  @override
  void initState() {
    super.initState();

    key = widget.key;

    showLabels = widget.showLabels;
    labelType = widget.labelType;
    labelEmphasis = widget.labelEmphasis;
    labelTextAlign = widget.labelTextAlign;

    textType = widget.textType;
    textEmphasis = widget.textEmphasis;
    textAlign = widget.textAlign;
    textFieldBackgroundType = widget.textFieldBackgroundType;

    showHints = widget.showHints ?? !showLabels;
    hintTextType = widget.hintTextType;
    hintTextEmphasis = widget.hintTextEmphasis;
    // hintTextAlign = widget.hintTextAlign;
    textFieldBackgroundType = widget.textFieldBackgroundType;

    showIcons = widget.showIcons ?? showHints;
    prefixIconType = widget.prefixIconType;
    prefixIconEmphasis = widget.prefixIconEmphasis;

    email = widget.email;
    showEmail = widget.showEmail;
    canEditEmail = widget.canEditEmail;
    obscureEmail = widget.obscureEmail;
    onEmailChangedCallback = widget.onEmailChangedCallback;
    emailLabel = widget.emailLabel;
    showEmailLabel = widget.showEmailLabel ?? widget.showLabels;
    emailHint = widget.emailHint;
    showEmailHint = widget.showEmailHint ?? showHints;
    emailIcon = widget.emailIcon;
    showEmailIcon = widget.showEmailIcon ?? showIcons;

    password = widget.password;
    showPassword = widget.showPassword;
    canEditPassword = widget.canEditPassword;
    obscurePassword = widget.obscurePassword;
    onPasswordChangedCallback = widget.onPasswordChangedCallback;
    passwordLabel = widget.passwordLabel;
    showPasswordLabel = widget.showPasswordLabel ?? widget.showLabels;
    passwordHint = widget.passwordHint;
    showPasswordHint = widget.showPasswordHint ?? showHints;
    passwordIcon = widget.passwordIcon;
    showPasswordIcon = widget.showPasswordIcon ?? showIcons;

    showForgots = widget.showForgots;
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
                    _buildStringEntry(canEditEmail, emailLabel, showEmailLabel, emailIcon, showEmailIcon, email, obscureEmail, emailHint, showEmailHint, onEmailChangedCallback,
                    validator: (value) => emailValidator(value, true)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringEntry(canEditPassword, passwordLabel, showPasswordLabel, passwordIcon, showPasswordIcon, password, obscurePassword, passwordHint, showPasswordHint, onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value, true)
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

  Widget _buildStringEntry(
    bool isEditable,
    String labelText,
    bool showLabel,
    IconData? prefixIcon,
    bool showPrefixIcon,
    String text,
    bool obscureText,
    String hintText,
    bool showHintText,
    ValueChanged<String>? onStringChangedCallback,
    {
      FormFieldValidator<String>? validator
    }
  ) => ThemedEditableLabelValue(
    showLabel: showLabel,
    labelText: labelText,
    labelType: labelType,
    labelEmphasis: labelEmphasis,
    labelTextAlign: labelTextAlign,
    prefixIcon: showPrefixIcon ? prefixIcon : null,
    prefixIconType: prefixIconType,
    prefixIconEmphasis: prefixIconEmphasis,
    text: text,
    textType: textType,
    textEmphasis: textEmphasis,
    obscureText: obscureText,
    hintText: showHintText ? hintText : "",
    hintTextType: hintTextType,
    hintTextEmphasis: hintTextEmphasis,
    backgroundType: textFieldBackgroundType,
    onStringChangedCallback: onStringChangedCallback,
    validator: validator
  );

  Widget _buildVerticalFooter() {
    return Padding(
      padding: footerPadding,
      child: Column(children: <Widget>[
        smallTransparentDivider,
        ElevatedButton(
          onPressed: () async {
            var valid = _formKey.currentState?.validate() ?? false;
            if(valid && isLogin) {
              onTapLogin?.call();
            } else if(valid && !isLogin) {
              onTapRegister?.call();
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
              if(!isLogin) {
                onTapLogin?.call()
              } else if(isLogin) {
                onTapRegister?.call()
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
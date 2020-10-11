import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

//TODO - clean this up and make it much easier to provide a simple theme field
class ThemedEmailEntry extends StatefulWidget {
  final bool showLabel;
  final bool showForgotEmail;
  final Function onTapForgotEmail;
  final ThemeGroupType labelType;
  final ThemeGroupType textFieldBackgroundType;
  final ValueChanged<String> onEmailChangedCallback;

  ThemedEmailEntry({
    this.showLabel = true,
    this.showForgotEmail = true,
    this.onTapForgotEmail,
    this.labelType = ThemeGroupType.MOP,
    this.textFieldBackgroundType = ThemeGroupType.MOM,
    this.onEmailChangedCallback
  });

  _ThemedEmailEntryState createState() => _ThemedEmailEntryState(
    showLabel,
    showForgotEmail,
    onTapForgotEmail,
    labelType,
    textFieldBackgroundType,
    onEmailChangedCallback
  );
}

class _ThemedEmailEntryState extends State<ThemedEmailEntry> {

  final bool showLabel;
  final bool showForgotEmail;
  final Function onTapForgotEmail;
  final ThemeGroupType labelType;
  final ThemeGroupType textFieldBackgroundType;
  final ValueChanged<String> onEmailChangedCallback;

  _ThemedEmailEntryState(
    this.showLabel,
    this.showForgotEmail,
    this.onTapForgotEmail,
    this.labelType,
    this.textFieldBackgroundType,
    this.onEmailChangedCallback
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showLabel) ... [
          ThemedSubTitle2('Email', type: labelType, emphasis: Emphasis.HIGH),
          miniTransparentDivider
        ],
        _buildEditText(context),
        if (showForgotEmail) ... [
          _buildForgotEmail(context)
        ]
      ],
    );
  }

  //TODO - make a themedButton with no emphasis that doesn't include the container - which is here to justify right
  Widget _buildForgotEmail(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: onTapForgotEmail != null ? onTapForgotEmail : () => print("Tapping forgot email"),
        padding: EdgeInsets.only(right: 0.0),
        child: ThemedSubTitle2('Forgot Email?', type: labelType, emphasis: Emphasis.HIGH),
      ),
    );
  }

  Widget _buildEditText(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
        color: context.watch<MaterialThemesManager>().getTheme(textFieldBackgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
        borderRadius: BorderRadius.circular(largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        decoration: InputDecoration(
          border: InputBorder.none,//hide the bottom EditText underscore bar
          contentPadding: EdgeInsets.only(top: paddingSmall),
          prefixIcon: ThemedIcon(Icons.email, type:ThemeGroupType.MOM),
          hintText: 'Email',
          hintStyle: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        ),
        validator: (val) => val.isEmpty ? 'Enter an email' : null,
        onChanged: (val){
          setState(() => {
            if(onEmailChangedCallback != null) {
              onEmailChangedCallback(val)
            }
          });
        },
      ),
    );
  }
}

//TODO - clean this up and make it much easier to provide a simple theme field
class ThemedPasswordEntry extends StatefulWidget {

    final bool showLabel;
    final bool showForgotPassword;
    final Function onTapForgotPassword;
    final ThemeGroupType labelType;
    final ThemeGroupType textFieldBackgroundType;
    final ValueChanged<String> onPasswordChangedCallback;

  ThemedPasswordEntry({
    this.showLabel = true,
    this.showForgotPassword = true,
    this.onTapForgotPassword,
    this.labelType = ThemeGroupType.MOP,
    this.textFieldBackgroundType = ThemeGroupType.MOM,
    this.onPasswordChangedCallback
  });

  _ThemedPasswordEntryState createState() => _ThemedPasswordEntryState(
    this.showLabel,
    this.showForgotPassword,
    this.onTapForgotPassword,
    this.labelType,
    this.textFieldBackgroundType,
    this.onPasswordChangedCallback
  );
}

class _ThemedPasswordEntryState extends State<ThemedPasswordEntry> {

  final bool showLabel;
  final bool showForgotPassword;
  final Function onTapForgotPassword;
  final ThemeGroupType labelType;
  final ThemeGroupType textFieldBackgroundType;
  final ValueChanged<String> onPasswordChangedCallback;

  _ThemedPasswordEntryState(
    this.showLabel,
    this.showForgotPassword,
    this.onTapForgotPassword,
    this.labelType,
    this.textFieldBackgroundType,
    this.onPasswordChangedCallback
  );

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(showLabel) ... [
          ThemedSubTitle2('Password', type: labelType, emphasis: Emphasis.HIGH),
          miniTransparentDivider
        ],
        _buildEditText(context),
        if(showForgotPassword) ... [
          _buildForgotPassword(context)
        ]
      ],
    );
  }

  //TODO - make a themedButton with no emphasis that doesn't include the container - which is here to justify right
  Widget _buildForgotPassword(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: onTapForgotPassword != null ? onTapForgotPassword : () => print("Tapping forgot password"),
        padding: EdgeInsets.only(right: 0.0),
        child: ThemedSubTitle2('Forgot Password?', type: labelType, emphasis: Emphasis.HIGH),
      ),
    );
  }

  Widget _buildEditText(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
        color: context.watch<MaterialThemesManager>().getTheme(textFieldBackgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
        borderRadius: BorderRadius.circular(largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        style: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,//hide the bottom EditText underscore bar
          contentPadding: EdgeInsets.only(top: paddingSmall),
          prefixIcon: ThemedIcon(Icons.lock, type:ThemeGroupType.MOM),
          hintText: 'Password',
          hintStyle: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        ),
        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
        onChanged: (val){
          setState(() => {
            if(onPasswordChangedCallback != null) {
              onPasswordChangedCallback(val)
            }
          });
        },
      ),
    );
  }
}


class ThemedStringEntry extends StatefulWidget {

  final ThemeGroupType textFieldBackgroundType;
  final ValueChanged<String> onStringChangedCallback;
  final FormFieldValidator<String> validator;
  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;

  ThemedStringEntry({
    this.textFieldBackgroundType = ThemeGroupType.MOM,
    this.onStringChangedCallback,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon
  });

  _ThemedStringEntryState createState() => _ThemedStringEntryState(
    this.textFieldBackgroundType,
    this.onStringChangedCallback,
    this.validator,
    this.hintText,
    this.obscureText,
    this.prefixIcon
  );
}

class _ThemedStringEntryState extends State<ThemedStringEntry> {

  final ThemeGroupType textFieldBackgroundType;
  final ValueChanged<String> onStringChangedCallback;
  final FormFieldValidator<String> validator;
  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;

  _ThemedStringEntryState(
    this.textFieldBackgroundType,
    this.onStringChangedCallback,
    this.validator,
    this.hintText,
    this.obscureText,
    this.prefixIcon
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
        color: context.watch<MaterialThemesManager>().getTheme(textFieldBackgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
        borderRadius: BorderRadius.circular(largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextFormField(
        style: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        obscureText: obscureText,
        decoration: InputDecoration(//TODO - make this work without an icon. It doesn't at the moment!
          border: InputBorder.none,//hide the bottom EditText underscore bar
          contentPadding: EdgeInsets.only(top: paddingSmall),
          prefixIcon: prefixIcon != null ? prefixIcon : Container(width: 0,height: 0),
          hintText: hintText != null ? hintText : "Balla",
          hintStyle: context.watch<MaterialThemesManager>().getTheme(ThemeGroupType.MOM).textTheme.subtitle1,
        ),
        validator: validator != null ? validator : (value) => null,
        onChanged: (val) {
          setState(() => {
            if(onStringChangedCallback != null) {
              onStringChangedCallback(val)
            } else {
              print("Changed:" + (hintText != null ? hintText : "Balla"))
            }
          });
        },
      ),
    );
  }
}
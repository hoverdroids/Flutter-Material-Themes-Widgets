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

  final bool showLabel;
  final String labelText;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final IconData prefixIcon;
  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final String text;
  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  //TODO final TextAlign textAlign;
  final bool obscureText;

  final String hintText;
  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final ThemeGroupType backgroundType;
  final ValueChanged<String> onStringChangedCallback;
  final FormFieldValidator<String> validator;

  ThemedStringEntry({
    this.showLabel = true,
    this.labelText = "",
    this.labelType = ThemeGroupType.MOM,
    this.labelEmphasis = Emphasis.HIGH,
    this.labelTextAlign = TextAlign.start,
    this.prefixIcon,
    this.prefixIconType = ThemeGroupType.MOM,
    this.prefixIconEmphasis = Emphasis.HIGH,
    this.text = "",
    this.textType = ThemeGroupType.MOM,
    this.textEmphasis = Emphasis.HIGH,
    this.obscureText = false,
    this.hintText = "",
    this.hintTextType = ThemeGroupType.MOM,
    this.hintTextEmphasis = Emphasis.NONE,
    this.backgroundType = ThemeGroupType.MOM,
    this.onStringChangedCallback,
    this.validator
  });

  _ThemedStringEntryState createState() => _ThemedStringEntryState(
      this.showLabel,
      this.labelText,
      this.labelType,
      this.labelEmphasis,
      this.labelTextAlign,
      this.prefixIcon,
      this.prefixIconType,
      this.prefixIconEmphasis,
      this.text,
      this.textType,
      this.textEmphasis,
      this.obscureText,
      this.hintText,
      this.hintTextType,
      this.hintTextEmphasis,
      this.backgroundType,
      this.onStringChangedCallback,
      this.validator
  );
}

class _ThemedStringEntryState extends State<ThemedStringEntry> {

  final bool showLabel;
  final String labelText;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final IconData prefixIcon;
  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final String text;
  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  //TODO final TextAlign textAlign;
  final bool obscureText;

  final String hintText;
  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final ThemeGroupType backgroundType;
  final ValueChanged<String> onStringChangedCallback;
  final FormFieldValidator<String> validator;

  _ThemedStringEntryState(
    this.showLabel,
    this.labelText,
    this.labelType,
    this.labelEmphasis,
    this.labelTextAlign,
    this.prefixIcon,
    this.prefixIconType,
    this.prefixIconEmphasis,
    this.text,
    this.textType,
    this.textEmphasis,
    this.obscureText,
    this.hintText,
    this.hintTextType,
    this.hintTextEmphasis,
    this.backgroundType,
    this.onStringChangedCallback,
    this.validator
  );

  FormFieldValidator<String> _validator() {
    return validator != null ? validator : (value) => null;//return null indicates the field is valid
  }

  void _onChanged(String val) {
    setState(() => {
      if(onStringChangedCallback != null) {
        onStringChangedCallback(val)
      } else {
        print("Changed:" + (hintText != null ? hintText : "Hint Text"))
      }
    });
  }

  Widget _buildIconTextField() {
    return TextFormField(
      style: context.watch<MaterialThemesManager>().getTheme(textType, emphasis: textEmphasis).textTheme.subtitle1,
      obscureText: obscureText,
      initialValue: text,
      decoration: InputDecoration(
        border: InputBorder.none,//hide the bottom EditText underscore bar
        contentPadding: EdgeInsets.only(top: paddingSmall),
        prefixIcon: ThemedIcon(prefixIcon, type: prefixIconType, emphasis: prefixIconEmphasis),
        hintText: hintText != null ? hintText : "",
        hintStyle: context.watch<MaterialThemesManager>().getTheme(hintTextType, emphasis: hintTextEmphasis).textTheme.subtitle1,
      ),
      validator: _validator(),
      onChanged: (val) => _onChanged(val),
    );
  }

  //When icon is null, we can't simply check for null to provide prefixIcon and contentPadding because the layout positioning is wrong.
  //The only way to make iconText and text works is with two separate builder functions
  Widget _buildTextField() {
    return TextFormField(
      style: context.watch<MaterialThemesManager>().getTheme(textType, emphasis: textEmphasis).textTheme.subtitle1,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,//hide the bottom EditText underscore bar
        contentPadding: EdgeInsets.symmetric(horizontal: paddingSmall),
        hintText: hintText != null ? hintText : "",
        hintStyle: context.watch<MaterialThemesManager>().getTheme(hintTextType).textTheme.subtitle1,
      ),
      validator: _validator(),
      onChanged: (val) => _onChanged(val),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showLabel) ThemedSubTitle2(labelText, type: labelType, emphasis: labelEmphasis, textAlign: labelTextAlign),
        miniTransparentDivider,
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration (//TODO - move this styling to ThemeManager?
              color: context.watch<MaterialThemesManager>().getTheme(backgroundType).scaffoldBackgroundColor,//TODO - this should be card color, right?
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
            child: prefixIcon != null ? _buildIconTextField() : _buildTextField()
        )
      ],
    );
  }
}
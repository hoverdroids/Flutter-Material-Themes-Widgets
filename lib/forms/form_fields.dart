import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

class ThemedLabelValue extends StatelessWidget {
  final bool showLabel;
  final String labelText;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final String text;
  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  final TextAlign textAlign;

  ThemedLabelValue({
    this.showLabel = true,
    this.labelText = "",
    this.labelType = ThemeGroupType.MOM,
    this.labelEmphasis = Emphasis.HIGH,
    this.labelTextAlign = TextAlign.start,
    this.text = "",
    this.textType = ThemeGroupType.MOM,
    this.textEmphasis = Emphasis.HIGH,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (showLabel) ThemedSubTitle2(labelText, type: labelType, emphasis: labelEmphasis, textAlign: labelTextAlign),
        miniTransparentDivider,
        ThemedTitle(text, type: textType, emphasis: textEmphasis, textAlign: textAlign)
      ],
    );
  }
}

class ThemedEditableLabelValue extends StatefulWidget {

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

  ThemedEditableLabelValue({
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

  _ThemedEditableLabelValueState createState() => _ThemedEditableLabelValueState(
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

class _ThemedEditableLabelValueState extends State<ThemedEditableLabelValue> {

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

  _ThemedEditableLabelValueState(
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
      initialValue: text,
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
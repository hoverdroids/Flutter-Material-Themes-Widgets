import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

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

  const ThemedLabelValue({
    super.key,
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

  final IconData? prefixIcon;
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
  final ValueChanged<String>? onStringChangedCallback;
  final FormFieldValidator<String>? validator;

  const ThemedEditableLabelValue({
    super.key,
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

  @override
  ThemedEditableLabelValueState createState() => ThemedEditableLabelValueState();
}

class ThemedEditableLabelValueState extends State<ThemedEditableLabelValue> {

  late bool showLabel;
  late String labelText;
  late ThemeGroupType labelType;
  late Emphasis labelEmphasis;
  late TextAlign labelTextAlign;

  late IconData? prefixIcon;
  late ThemeGroupType prefixIconType;
  late Emphasis prefixIconEmphasis;

  late String? text;
  late ThemeGroupType textType;
  late Emphasis textEmphasis;
  //TODO late TextAlign textAlign;
  late bool obscureText;

  late String? hintText;
  late ThemeGroupType hintTextType;
  late Emphasis hintTextEmphasis;
  //TODO late TextAlign hintTextAlign;

  late ThemeGroupType backgroundType;
  late ValueChanged<String>? onStringChangedCallback;
  late FormFieldValidator<String>? validator;

  FormFieldValidator<String>? _validator() => validator ?? (value) => null;//return null indicates the field is valid

  @override
  void initState() {
    super.initState();

    showLabel = widget.showLabel;
    labelText = widget.labelText;
    labelType = widget.labelType;
    labelEmphasis = widget.labelEmphasis;
    labelTextAlign = widget.labelTextAlign;
    prefixIcon = widget.prefixIcon;
    prefixIconType = widget.prefixIconType;
    prefixIconEmphasis = widget.prefixIconEmphasis;
    text = widget.text;
    textType = widget.textType;
    textEmphasis = widget.textEmphasis;
    obscureText = widget.obscureText;
    hintText = widget.hintText;
    hintTextType = widget.hintTextType;
    hintTextEmphasis = widget.hintTextEmphasis;
    backgroundType = widget.backgroundType;
    onStringChangedCallback = widget.onStringChangedCallback;
    validator = widget.validator;
  }

  void _onChanged(String val) {
    setState(() => {
      if(onStringChangedCallback != null) {
        onStringChangedCallback?.call(val)
      } else {
        developer.log("Changed:${hintText ?? 'Hint Text'}")
      }
    });
  }

  Widget _buildIconTextField() {
    return TextFormField(
      style: context.watch<MaterialThemesManager>().getTheme(textType, emphasis: textEmphasis).textTheme.titleMedium,
      obscureText: obscureText,
      initialValue: text,
      decoration: InputDecoration(
        border: InputBorder.none,//hide the bottom EditText underscore bar
        contentPadding: const EdgeInsets.only(top: paddingSmall),
        prefixIcon: ThemedIcon(prefixIcon, type: prefixIconType, emphasis: prefixIconEmphasis),
        hintText: hintText ?? "",
        hintStyle: context.watch<MaterialThemesManager>().getTheme(hintTextType, emphasis: hintTextEmphasis).textTheme.titleMedium,
      ),
      validator: _validator(),
      onChanged: (val) => _onChanged(val),
    );
  }

  //When icon is null, we can't simply check for null to provide prefixIcon and contentPadding because the layout positioning is wrong.
  //The only way to make iconText and text works is with two separate builder functions
  Widget _buildTextField() {
    return TextFormField(
      style: context.watch<MaterialThemesManager>().getTheme(textType, emphasis: textEmphasis).textTheme.titleMedium,
      obscureText: obscureText,
      initialValue: text,
      decoration: InputDecoration(
        border: InputBorder.none,//hide the bottom EditText underscore bar
        contentPadding: const EdgeInsets.symmetric(horizontal: paddingSmall),
        hintText: hintText ?? "",
        hintStyle: context.watch<MaterialThemesManager>().getTheme(hintTextType).textTheme.titleMedium,
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
              boxShadow: const [
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
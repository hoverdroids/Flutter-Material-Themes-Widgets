import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/utils/validators.dart';
import 'dart:developer' as developer;

class ProfileScreen extends StatefulWidget {

  final bool showLabels;
  final ThemeGroupType labelType;
  final Emphasis labelEmphasis;
  final TextAlign labelTextAlign;

  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  final TextAlign textAlign;

  final ThemeGroupType valueTextType;
  final Emphasis valueTextEmphasis;
  final TextAlign valueTextAlign;

  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  //TODO final TextAlign hintTextAlign;

  final ThemeGroupType textFieldBackgroundType;
  final String email;
  final ValueChanged<String>? onEmailChangedCallback;
  final bool showEmail;
  final String password;
  final ValueChanged<String>? onPasswordChangedCallback;
  final bool showPassword;
  final String firstName;
  final ValueChanged<String>? onFirstNameChangedCallback;
  final bool showFirstName;
  final String lastName;
  final ValueChanged<String>? onLastNameChangedCallback;
  final bool showLastName;
  final String tagline;
  final ValueChanged<String>? onTaglineChangedCallback;
  final bool showTagline;
  final String pronouns;
  final ValueChanged<String>? onPronounsChangedCallback;
  final bool showPronouns;
  final String organization;
  final ValueChanged<String>? onOrganizationChangedCallback;
  final bool showOrganization;
  final String address;
  final ValueChanged<String>? onAddressChangedCallback;
  final bool showAddress;
  final String city;
  final ValueChanged<String>? onCityChangedCallback;
  final bool showCity;
  final String state;
  final ValueChanged<String>? onStateChangedCallback;
  final bool showState;
  final String zip;
  final ValueChanged<String>? onZipChangedCallback;
  final bool showZip;
  final VoidCallback? onTapLogout;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapSave;
  final VoidCallback? onTapDelete;
  final bool doShowLoginRegisterButtons;
  final EdgeInsets padding;
  final bool isHeaderSticky;
  final bool isFooterSticky;
  final bool isFooterVertical;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;
  final bool centerForm;
  final bool isEditMode;

  const ProfileScreen({
    super.key,
    this.showLabels = true,
    this.labelType = ThemeGroupType.MOP,
    this.labelEmphasis = Emphasis.NONE,
    this.labelTextAlign = TextAlign.start,
    this.prefixIconType = ThemeGroupType.MOM,
    this.prefixIconEmphasis = Emphasis.NONE,
    this.textType = ThemeGroupType.POM,
    this.textEmphasis = Emphasis.HIGH,
    this.textAlign = TextAlign.start,
    this.valueTextType = ThemeGroupType.MOP,
    this.valueTextEmphasis = Emphasis.HIGH,
    this.valueTextAlign = TextAlign.start,
    this.hintTextType = ThemeGroupType.MOM,
    this.hintTextEmphasis = Emphasis.NONE,
    this.textFieldBackgroundType = ThemeGroupType.MOP,
    this.email = "",
    this.onEmailChangedCallback,
    this.showEmail = true,
    this.password = "",
    this.onPasswordChangedCallback,
    this.showPassword = true,
    this.firstName = "",
    this.onFirstNameChangedCallback,
    this.showFirstName = true,
    this.lastName = "",
    this.onLastNameChangedCallback,
    this.showLastName = true,
    this.tagline = "",
    this.onTaglineChangedCallback,
    this.showTagline = true,
    this.pronouns = "",
    this.onPronounsChangedCallback,
    this.showPronouns = true,
    this.organization = "",
    this.onOrganizationChangedCallback,
    this.showOrganization = true,
    this.address = "",
    this.onAddressChangedCallback,
    this.showAddress = true,
    this.city = "",
    this.onCityChangedCallback,
    this.showCity = true,
    this.state = "",
    this.onStateChangedCallback,
    this.showState = true,
    this.zip = "",
    this.onZipChangedCallback,
    this.showZip = true,
    this.onTapLogout,
    this.onTapEdit,
    this.onTapSave,
    this.onTapDelete,
    this.doShowLoginRegisterButtons = true,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0, horizontal: paddingMini),
    this.isHeaderSticky = true,
    this.isFooterSticky = true,
    this.isFooterVertical = false,
    this.headerPadding = const EdgeInsets.all(paddingMini),
    this.footerPadding = const EdgeInsets.all(paddingMini),
    this.centerForm = true,
    this.isEditMode = false
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {

  late bool showLabels;
  late ThemeGroupType labelType;
  late Emphasis labelEmphasis;
  late TextAlign labelTextAlign;

  late ThemeGroupType prefixIconType;
  late Emphasis prefixIconEmphasis;

  late ThemeGroupType textType;
  late Emphasis textEmphasis;
  late TextAlign textAlign;

  late ThemeGroupType valueTextType;
  late Emphasis valueTextEmphasis;
  late TextAlign valueTextAlign;

  late ThemeGroupType hintTextType;
  late Emphasis hintTextEmphasis;
  //TODO late TextAlign hintTextAlign;

  late ThemeGroupType textFieldBackgroundType;
  late String email;
  late ValueChanged<String>? onEmailChangedCallback;
  late bool showEmail;
  late String password;
  late ValueChanged<String>? onPasswordChangedCallback;
  late bool showPassword;
  late String firstName;
  late ValueChanged<String>? onFirstNameChangedCallback;
  late bool showFirstName;
  late String lastName;
  late ValueChanged<String>? onLastNameChangedCallback;
  late bool showLastName;
  late String tagline;
  late ValueChanged<String>? onTaglineChangedCallback;
  late bool showTagline;
  late String pronouns;
  late ValueChanged<String>? onPronounsChangedCallback;
  late bool showPronouns;
  late String organization;
  late ValueChanged<String>? onOrganizationChangedCallback;
  late bool showOrganization;
  late String address;
  late ValueChanged<String>? onAddressChangedCallback;
  late bool showAddress;
  late String city;
  late ValueChanged<String>? onCityChangedCallback;
  late bool showCity;
  late String state;
  late ValueChanged<String>? onStateChangedCallback;
  late bool showState;
  late String zip;
  late ValueChanged<String>? onZipChangedCallback;
  late bool showZip;
  late VoidCallback? onTapLogout;
  late VoidCallback? onTapEdit;
  late VoidCallback? onTapSave;
  late VoidCallback? onTapDelete;
  late bool doShowLoginRegisterButtons;
  late EdgeInsets padding;
  late bool isHeaderSticky;
  late bool isFooterSticky;
  late bool isFooterVertical;
  late EdgeInsets headerPadding;
  late EdgeInsets footerPadding;
  late bool centerForm;
  late bool isEditMode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    
    showLabels = widget.showLabels;
    labelType = widget.labelType;
    labelEmphasis = widget.labelEmphasis;
    labelTextAlign = widget.labelTextAlign;
    prefixIconType = widget.prefixIconType;
    prefixIconEmphasis = widget.prefixIconEmphasis;
    textType = widget.textType;
    textEmphasis = widget.textEmphasis;
    textAlign = widget.textAlign;
    valueTextType = widget.valueTextType;
    valueTextEmphasis = widget.valueTextEmphasis;
    valueTextAlign = widget.valueTextAlign;
    hintTextType = widget.hintTextType;
    hintTextEmphasis = widget.hintTextEmphasis;
    textFieldBackgroundType = widget.textFieldBackgroundType;
    email = widget.email;
    onEmailChangedCallback = widget.onEmailChangedCallback;
    showEmail = widget.showEmail;
    password = widget.password;
    onPasswordChangedCallback = widget.onPasswordChangedCallback;
    showPassword = widget.showPassword;
    firstName = widget.firstName;
    onFirstNameChangedCallback = widget.onFirstNameChangedCallback;
    showFirstName = widget.showFirstName;
    lastName = widget.lastName;
    onLastNameChangedCallback = widget.onLastNameChangedCallback;
    showLastName = widget.showLastName;
    tagline = widget.tagline;
    onTaglineChangedCallback = widget.onTaglineChangedCallback;
    showTagline = widget.showTagline;
    pronouns = widget.pronouns;
    onPronounsChangedCallback = widget.onPasswordChangedCallback;
    showPronouns = widget.showPronouns;
    organization = widget.organization;
    onOrganizationChangedCallback = widget.onOrganizationChangedCallback;
    showOrganization = widget.showOrganization;
    address = widget.address;
    onAddressChangedCallback = widget.onAddressChangedCallback;
    showAddress = widget.showAddress;
    city = widget.city;
    onCityChangedCallback = widget.onCityChangedCallback;
    showCity = widget.showCity;
    state = widget.state;
    onStateChangedCallback = widget.onStateChangedCallback;
    showState = widget.showState;
    zip = widget.zip;
    onZipChangedCallback = widget.onZipChangedCallback;
    showZip = widget.showZip;
    onTapLogout = widget.onTapLogout;
    onTapEdit = widget.onTapEdit;
    onTapSave = widget.onTapSave;
    onTapDelete = widget.onTapDelete;
    doShowLoginRegisterButtons = widget.doShowLoginRegisterButtons;
    padding = widget.padding;
    isHeaderSticky = widget.isHeaderSticky;
    isFooterSticky = widget.isFooterSticky;
    isFooterVertical = widget.isFooterVertical;
    headerPadding = widget.headerPadding;
    footerPadding = widget.footerPadding;
    centerForm = widget.centerForm;
    isEditMode = widget.isEditMode;
  }

  Widget _buildHeader() {
    return Padding(
      padding: headerPadding,
      child:ThemedH4("Profile", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH)
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
                  if(!isHeaderSticky) ... [ _buildHeader() ],
                  smallTransparentDivider,
                  if (showEmail) ... [
                    _buildStringField(text: email, labelText: "Email", hintText: showLabels ? "" : "Email", prefixIcon: showLabels ? null : Icons.email, onStringChangedCallback: onEmailChangedCallback,
                      validator: (value) => emailValidator(value, true)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringField(text: password, labelText: "Password", hintText: showLabels ? "" : "Password", prefixIcon: showLabels ? null : Icons.lock, onStringChangedCallback: onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value, true),
                    ),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    _buildStringField(text: firstName, labelText: "First Name", hintText: showLabels ? "" : "First Name", onStringChangedCallback: onFirstNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "First Name", true)),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    _buildStringField(text: lastName, labelText: "Last Name", hintText: showLabels ? "" : "Last Name", onStringChangedCallback: onLastNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Last Name", true)),
                    smallTransparentDivider
                  ],
                  if (showTagline) ... [
                    _buildStringField(text: tagline, labelText: "Tagline", hintText: showLabels ? "e.g. Adventurer" : "Tagline", onStringChangedCallback: onTaglineChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPronouns) ... [
                    _buildStringField(text: pronouns, labelText: "Pronouns", hintText: showLabels ? "" : "Pronouns", onStringChangedCallback: onPronounsChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showOrganization) ... [
                    _buildStringField(text: organization, labelText: "Organization", hintText: showLabels ? "" : "Organization", onStringChangedCallback: onOrganizationChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showAddress) ... [
                    _buildStringField(text: address, labelText: "Address", hintText: showLabels ? "" : "Address", onStringChangedCallback: onAddressChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showCity) ... [
                    _buildStringField(text: city, labelText: "City", hintText: showLabels ? "" : "City", onStringChangedCallback: onCityChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showState) ... [
                    _buildStringField(text: state, labelText: "State", hintText: showLabels ? "" : "State", onStringChangedCallback: onStateChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showZip) ... [
                    _buildStringField(text: zip, labelText: "Zip", hintText: showLabels ? "" : "Zip", onStringChangedCallback: onZipChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Zip", true)),
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

  Widget _buildStringField({
    String labelText = "",
    IconData? prefixIcon,
    String text = "",
    bool obscureText = false,
    String hintText = "",
    ValueChanged<String>? onStringChangedCallback,
    FormFieldValidator<String>? validator
  }) {

    return isEditMode
      ? ThemedEditableLabelValue(
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
        )
      : ThemedLabelValue(
          showLabel: showLabels,
          labelText: labelText,
          labelType: labelType,
          labelEmphasis: labelEmphasis,
          labelTextAlign: labelTextAlign,
          text: text,
          textType: valueTextType,
          textEmphasis: valueTextEmphasis,
          textAlign: valueTextAlign
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
              child: TextButton(
                onPressed: onTapLogout ?? () => developer.log("Tapped Logout"),
                child: ThemedSubTitle2("Logout", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
              ),
            )
        ),
        Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: onTapDelete ?? () => developer.log("Tapped Delete Account"),
                child: ThemedSubTitle2("Delete Account", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
              ),
            )
        ),
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                var valid = _formKey.currentState?.validate() ?? false;
                if(valid && isEditMode) {
                  onTapSave?.call();
                } else if(valid && !isEditMode) {
                  onTapEdit?.call();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: ThemedTitle(isEditMode ? "Save" : "Edit", type: ThemeGroupType.POM),
            )
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
        ElevatedButton(
          onPressed: () async {
            var valid = _formKey.currentState?.validate() ?? false;
            if(valid && isEditMode) {
              onTapSave?.call();
            } else if(valid && !isEditMode) {
              onTapEdit?.call();
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            backgroundColor: Colors.white,
            shape: const StadiumBorder(),
          ),
          child: ThemedTitle(isEditMode ? "Save" : "Edit", type: ThemeGroupType.POM),
        ),
        smallTransparentDivider,
        Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: onTapLogout ?? () => developer.log("Tapped Logout"),
            child: ThemedSubTitle2("Logout", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
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

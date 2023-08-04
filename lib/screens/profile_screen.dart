import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/utils/validators.dart';

class ProfileScreen extends StatefulWidget {

  final Key? key;

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

  ProfileScreen({
    this.key,
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
  _ProfileScreenState createState() => _ProfileScreenState(
    key,
    showLabels,
    labelType,
    labelEmphasis,
    labelTextAlign,
    prefixIconType,
    prefixIconEmphasis,
    textType,
    textEmphasis,
    textAlign,
    valueTextType,
    valueTextEmphasis,
    valueTextAlign,
    hintTextType,
    hintTextEmphasis,
    textFieldBackgroundType,
    email,
    onEmailChangedCallback,
    showEmail,
    password,
    onPasswordChangedCallback,
    showPassword,
    firstName,
    onFirstNameChangedCallback,
    showFirstName,
    lastName,
    onLastNameChangedCallback,
    showLastName,
    tagline,
    onTaglineChangedCallback,
    showTagline,
    pronouns,
    onPronounsChangedCallback,
    showPronouns,
    organization,
    onOrganizationChangedCallback,
    showOrganization,
    address,
    onAddressChangedCallback,
    showAddress,
    city,
    onCityChangedCallback,
    showCity,
    state,
    onStateChangedCallback,
    showState,
    zip,
    onZipChangedCallback,
    showZip,
    onTapLogout,
    onTapEdit,
    onTapSave,
    onTapDelete,
    doShowLoginRegisterButtons,
    padding,
    isHeaderSticky,
    isFooterSticky,
    isFooterVertical,
    headerPadding,
    footerPadding,
    centerForm,
    isEditMode
  );
}

class _ProfileScreenState extends State<ProfileScreen> {

  final Key? key;

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

  final _formKey = GlobalKey<FormState>();

  _ProfileScreenState(
    this.key,
    this.showLabels,
    this.labelType,
    this.labelEmphasis,
    this.labelTextAlign,
    this.prefixIconType,
    this.prefixIconEmphasis,
    this.textType,
    this.textEmphasis,
    this.textAlign,
    this.valueTextType,
    this.valueTextEmphasis,
    this.valueTextAlign,
    this.hintTextType,
    this.hintTextEmphasis,
    this.textFieldBackgroundType,
    this.email,
    this.onEmailChangedCallback,
    this.showEmail,
    this.password,
    this.onPasswordChangedCallback,
    this.showPassword,
    this.firstName,
    this.onFirstNameChangedCallback,
    this.showFirstName,
    this.lastName,
    this.onLastNameChangedCallback,
    this.showLastName,
    this.tagline,
    this.onTaglineChangedCallback,
    this.showTagline,
    this.pronouns,
    this.onPronounsChangedCallback,
    this.showPronouns,
    this.organization,
    this.onOrganizationChangedCallback,
    this.showOrganization,
    this.address,
    this.onAddressChangedCallback,
    this.showAddress,
    this.city,
    this.onCityChangedCallback,
    this.showCity,
    this.state,
    this.onStateChangedCallback,
    this.showState,
    this.zip,
    this.onZipChangedCallback,
    this.showZip,
    this.onTapLogout,
    this.onTapEdit,
    this.onTapSave,
    this.onTapDelete,
    this.doShowLoginRegisterButtons,
    this.padding,
    this.isHeaderSticky,
    this.isFooterSticky,
    this.isFooterVertical,
    this.headerPadding,
    this.footerPadding,
    this.centerForm,
    this.isEditMode
  );

  Widget _buildHeader() {
    return Padding(
      padding: headerPadding,
      child:ThemedH4("Profile", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH)
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
                    _buildStringField(text: email, labelText: "Email", hintText: showLabels ? "" : "Email", prefixIcon: showLabels ? null : Icons.email, onStringChangedCallback: onEmailChangedCallback,
                      validator: (value) => emailValidator(value)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringField(text: password, labelText: "Password", hintText: showLabels ? "" : "Password", prefixIcon: showLabels ? null : Icons.lock, onStringChangedCallback: onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value),
                    ),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    _buildStringField(text: firstName, labelText: "First Name", hintText: showLabels ? "" : "First Name", onStringChangedCallback: onFirstNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "First Name")),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    _buildStringField(text: lastName, labelText: "Last Name", hintText: showLabels ? "" : "Last Name", onStringChangedCallback: onLastNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Last Name")),
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
              child: FlatButton(
                onPressed: onTapLogout ?? () => print("Tapped Logout"),
                child: ThemedSubTitle2("Logout", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
              ),
            )
        ),
        Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: onTapDelete ?? () => print("Tapped Delete Account"),
                child: ThemedSubTitle2("Delete Account", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
              ),
            )
        ),
        Flexible(
          flex: 1,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () async {
              var valid = _formKey.currentState?.validate() ?? false;
              if(valid && isEditMode) {
                onTapSave?.call();
              } else if(valid && !isEditMode) {
                onTapEdit?.call();
              }
            },
            child: ThemedTitle(isEditMode ? "Save" : "Edit", type: ThemeGroupType.POM),
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
            var valid = _formKey.currentState?.validate() ?? false;
            if(valid && isEditMode) {
              onTapSave?.call();
            } else if(valid && !isEditMode) {
              onTapEdit?.call();
            }
          },
          child: ThemedTitle(isEditMode ? "Save" : "Edit", type: ThemeGroupType.POM),
          shape: StadiumBorder(),
        ),
        smallTransparentDivider,
        Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: onTapLogout != null ? onTapLogout : () => print("Tapped Logout"),
            child: ThemedSubTitle2("Logout", type: ThemeGroupType.MOP, emphasis: Emphasis.HIGH),
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

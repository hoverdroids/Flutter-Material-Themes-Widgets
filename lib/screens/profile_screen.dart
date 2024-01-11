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

  final bool? showIcons;
  final ThemeGroupType prefixIconType;
  final Emphasis prefixIconEmphasis;

  final ThemeGroupType textType;
  final Emphasis textEmphasis;
  final TextAlign textAlign;
  final ThemeGroupType textFieldBackgroundType;

  final ThemeGroupType valueTextType;
  final Emphasis valueTextEmphasis;
  final TextAlign valueTextAlign;

  final bool? showHints;
  final ThemeGroupType hintTextType;
  final Emphasis hintTextEmphasis;
  // final TextAlign hintTextAlign;

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
  
  final String firstName;
  final bool showFirstName;
  final bool canEditFirstName;
  final bool obscureFirstName;
  final ValueChanged<String>? onFirstNameChangedCallback;
  final String firstNameLabel;
  final bool? showFirstNameLabel;
  final String firstNameHint;
  final bool? showFirstNameHint;
  final IconData? firstNameIcon;
  final bool? showFirstNameIcon;
  
  final String lastName;
  final bool showLastName;
  final bool canEditLastName;
  final bool obscureLastName;
  final ValueChanged<String>? onLastNameChangedCallback;
  final String lastNameLabel;
  final bool? showLastNameLabel;
  final String lastNameHint;
  final bool? showLastNameHint;
  final IconData? lastNameIcon;
  final bool? showLastNameIcon;
  
  final String tagline;
  final bool showTagline;
  final bool canEditTagline;
  final bool obscureTagline;
  final ValueChanged<String>? onTaglineChangedCallback;
  final String taglineLabel;
  final bool? showTaglineLabel;
  final String taglineHint;
  final bool? showTaglineHint;
  final IconData? taglineIcon;
  final bool? showTaglineIcon;
  
  final String pronouns;
  final bool showPronouns;
  final bool canEditPronouns;
  final bool obscurePronouns;
  final ValueChanged<String>? onPronounsChangedCallback;
  final String pronounsLabel;
  final bool? showPronounsLabel;
  final String pronounsHint;
  final bool? showPronounsHint;
  final IconData? pronounsIcon;
  final bool? showPronounsIcon;
  
  final String organization;
  final bool showOrganization;
  final bool canEditOrganization;
  final bool obscureOrganization;
  final ValueChanged<String>? onOrganizationChangedCallback;
  final String organizationLabel;
  final bool? showOrganizationLabel;
  final String organizationHint;
  final bool? showOrganizationHint;
  final IconData? organizationIcon;
  final bool? showOrganizationIcon;
  
  final String address;
  final bool showAddress;
  final bool canEditAddress;
  final bool obscureAddress;
  final ValueChanged<String>? onAddressChangedCallback;
  final String addressLabel;
  final bool? showAddressLabel;
  final String addressHint;
  final bool? showAddressHint;
  final IconData? addressIcon;
  final bool? showAddressIcon;
  
  final String city;
  final bool showCity;
  final bool canEditCity;
  final bool obscureCity;
  final ValueChanged<String>? onCityChangedCallback;
  final String cityLabel;
  final bool? showCityLabel;
  final String cityHint;
  final bool? showCityHint;
  final IconData? cityIcon;
  final bool? showCityIcon;
  
  final String state;
  final bool showState;
  final bool canEditState;
  final bool obscureState;
  final ValueChanged<String>? onStateChangedCallback;
  final String stateLabel;
  final bool? showStateLabel;
  final String stateHint;
  final bool? showStateHint;
  final IconData? stateIcon;
  final bool? showStateIcon;
  
  final String zip;
  final bool showZip;
  final bool canEditZip;
  final bool obscureZip;
  final ValueChanged<String>? onZipChangedCallback;
  final String zipLabel;
  final bool? showZipLabel;
  final String zipHint;
  final bool? showZipHint;
  final IconData? zipIcon;
  final bool? showZipIcon;
  
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
    
    this.showIcons,
    this.prefixIconType = ThemeGroupType.MOM,
    this.prefixIconEmphasis = Emphasis.NONE,
    
    this.textType = ThemeGroupType.POM,
    this.textEmphasis = Emphasis.HIGH,
    this.textAlign = TextAlign.start,
    this.textFieldBackgroundType = ThemeGroupType.MOP,
    
    this.valueTextType = ThemeGroupType.MOP,
    this.valueTextEmphasis = Emphasis.HIGH,
    this.valueTextAlign = TextAlign.start,

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
    this.obscurePassword = false,
    this.onPasswordChangedCallback,
    this.passwordLabel = "Password",
    this.showPasswordLabel,
    this.passwordHint = "Password",
    this.showPasswordHint,
    this.passwordIcon = Icons.password,
    this.showPasswordIcon,
    
    this.firstName = "",
    this.showFirstName = true,
    this.canEditFirstName = true,
    this.obscureFirstName = false,
    this.onFirstNameChangedCallback,
    this.firstNameLabel = "First Name",
    this.showFirstNameLabel,
    this.firstNameHint = "First Name",
    this.showFirstNameHint,
    this.firstNameIcon,
    this.showFirstNameIcon,
    
    this.lastName = "",
    this.showLastName = true,
    this.canEditLastName = true,
    this.obscureLastName = false,
    this.onLastNameChangedCallback,
    this.lastNameLabel = "Last Name",
    this.showLastNameLabel,
    this.lastNameHint = "Last Name",
    this.showLastNameHint,
    this.lastNameIcon,
    this.showLastNameIcon,
    
    this.tagline = "",
    this.showTagline = true,
    this.canEditTagline = true,
    this.obscureTagline = false,
    this.onTaglineChangedCallback,
    this.taglineLabel = "Tagline",
    this.showTaglineLabel,
    this.taglineHint = "Tagline",
    this.showTaglineHint,
    this.taglineIcon,
    this.showTaglineIcon,
    
    this.pronouns = "",
    this.showPronouns = true,
    this.canEditPronouns = true,
    this.obscurePronouns = false,
    this.onPronounsChangedCallback,
    this.pronounsLabel = "Pronouns",
    this.showPronounsLabel,
    this.pronounsHint = "Pronouns",
    this.showPronounsHint,
    this.pronounsIcon,
    this.showPronounsIcon,
    
    this.organization = "",
    this.showOrganization = true,
    this.canEditOrganization = true,
    this.obscureOrganization = false,
    this.onOrganizationChangedCallback,
    this.organizationLabel = "Organization",
    this.showOrganizationLabel,
    this.organizationHint = "Organization",
    this.showOrganizationHint,
    this.organizationIcon,
    this.showOrganizationIcon,
    
    this.address = "",
    this.showAddress = true,
    this.canEditAddress = true,
    this.obscureAddress = false,
    this.onAddressChangedCallback,
    this.addressLabel = "Address",
    this.showAddressLabel,
    this.addressHint = "Address",
    this.showAddressHint,
    this.addressIcon,
    this.showAddressIcon,
    
    this.city = "",
    this.showCity = true,
    this.canEditCity = true,
    this.obscureCity = false,
    this.onCityChangedCallback,
    this.cityLabel = "City",
    this.showCityLabel,
    this.cityHint = "City",
    this.showCityHint,
    this.cityIcon,
    this.showCityIcon,
    
    this.state = "",
    this.showState = true,
    this.canEditState = true,
    this.obscureState = false,
    this.onStateChangedCallback,
    this.stateLabel = "State",
    this.showStateLabel,
    this.stateHint = "State",
    this.showStateHint,
    this.stateIcon,
    this.showStateIcon,
    
    this.zip = "",
    this.showZip = true,
    this.canEditZip = true,
    this.obscureZip = false,
    this.onZipChangedCallback,
    this.zipLabel = "Zip",
    this.showZipLabel,
    this.zipHint = "Zip",
    this.showZipHint,
    this.zipIcon,
    this.showZipIcon,
    
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

  late bool showIcons;
  late ThemeGroupType prefixIconType;
  late Emphasis prefixIconEmphasis;

  late ThemeGroupType textType;
  late Emphasis textEmphasis;
  late TextAlign textAlign;
  late ThemeGroupType textFieldBackgroundType;

  late ThemeGroupType valueTextType;
  late Emphasis valueTextEmphasis;
  late TextAlign valueTextAlign;

  late bool showHints;
  late ThemeGroupType hintTextType;
  late Emphasis hintTextEmphasis;
  // late TextAlign hintTextAlign;

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

  late String firstName;
  late bool showFirstName;
  late bool canEditFirstName;
  late bool obscureFirstName;
  late ValueChanged<String>? onFirstNameChangedCallback;
  late String firstNameLabel;
  late bool showFirstNameLabel;
  late String firstNameHint;
  late bool showFirstNameHint;
  late IconData? firstNameIcon;
  late bool showFirstNameIcon;

  late String lastName;
  late bool showLastName;
  late bool canEditLastName;
  late bool obscureLastName;
  late ValueChanged<String>? onLastNameChangedCallback;
  late String lastNameLabel;
  late bool showLastNameLabel;
  late String lastNameHint;
  late bool showLastNameHint;
  late IconData? lastNameIcon;
  late bool showLastNameIcon;

  late String tagline;
  late bool showTagline;
  late bool canEditTagline;
  late bool obscureTagline;
  late ValueChanged<String>? onTaglineChangedCallback;
  late String taglineLabel;
  late bool showTaglineLabel;
  late String taglineHint;
  late bool showTaglineHint;
  late IconData? taglineIcon;
  late bool showTaglineIcon;

  late String pronouns;
  late bool showPronouns;
  late bool canEditPronouns;
  late bool obscurePronouns;
  late ValueChanged<String>? onPronounsChangedCallback;
  late String pronounsLabel;
  late bool showPronounsLabel;
  late String pronounsHint;
  late bool showPronounsHint;
  late IconData? pronounsIcon;
  late bool showPronounsIcon;

  late String organization;
  late bool showOrganization;
  late bool canEditOrganization;
  late bool obscureOrganization;
  late ValueChanged<String>? onOrganizationChangedCallback;
  late String organizationLabel;
  late bool showOrganizationLabel;
  late String organizationHint;
  late bool showOrganizationHint;
  late IconData? organizationIcon;
  late bool showOrganizationIcon;

  late String address;
  late bool showAddress;
  late bool canEditAddress;
  late bool obscureAddress;
  late ValueChanged<String>? onAddressChangedCallback;
  late String addressLabel;
  late bool showAddressLabel;
  late String addressHint;
  late bool showAddressHint;
  late IconData? addressIcon;
  late bool showAddressIcon;

  late String city;
  late bool showCity;
  late bool canEditCity;
  late bool obscureCity;
  late ValueChanged<String>? onCityChangedCallback;
  late String cityLabel;
  late bool showCityLabel;
  late String cityHint;
  late bool showCityHint;
  late IconData? cityIcon;
  late bool showCityIcon;

  late String state;
  late bool showState;
  late bool canEditState;
  late bool obscureState;
  late ValueChanged<String>? onStateChangedCallback;
  late String stateLabel;
  late bool showStateLabel;
  late String stateHint;
  late bool showStateHint;
  late IconData? stateIcon;
  late bool showStateIcon;

  late String zip;
  late bool showZip;
  late bool canEditZip;
  late bool obscureZip;
  late ValueChanged<String>? onZipChangedCallback;
  late String zipLabel;
  late bool showZipLabel;
  late String zipHint;
  late bool showZipHint;
  late IconData? zipIcon;
  late bool showZipIcon;

  late VoidCallback? onTapLogout;
  late VoidCallback? onTapEdit;
  late VoidCallback? onTapSave;
  late VoidCallback? onTapDelete;
  late bool doShowLoginRegisterButtons;
  late EdgeInsets padding;

  late EdgeInsets headerPadding;
  late bool isHeaderSticky;

  late EdgeInsets footerPadding;
  late bool isFooterSticky;
  late bool isFooterVertical;

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

    textType = widget.textType;
    textEmphasis = widget.textEmphasis;
    textAlign = widget.textAlign;
    textFieldBackgroundType = widget.textFieldBackgroundType;

    valueTextType = widget.valueTextType;
    valueTextEmphasis = widget.valueTextEmphasis;
    valueTextAlign = widget.valueTextAlign;

    showHints = widget.showHints ?? !showLabels;
    hintTextType = widget.hintTextType;
    hintTextEmphasis = widget.hintTextEmphasis;
    // hintTextAlign = widget.hintTextAlign;

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
    
    firstName = widget.firstName;
    showFirstName = widget.showFirstName;
    canEditFirstName = widget.canEditFirstName;
    obscureFirstName = widget.obscureFirstName;
    onFirstNameChangedCallback = widget.onFirstNameChangedCallback;
    firstNameLabel = widget.firstNameLabel;
    showFirstNameLabel = widget.showFirstNameLabel ?? widget.showLabels;
    firstNameHint = widget.firstNameHint;
    showFirstNameHint = widget.showFirstNameHint ?? showHints;
    firstNameIcon = widget.firstNameIcon;
    showFirstNameIcon = widget.showFirstNameIcon ?? showIcons;
    
    lastName = widget.lastName;
    showLastName = widget.showLastName;
    canEditLastName = widget.canEditLastName;
    obscureLastName = widget.obscureLastName;
    onLastNameChangedCallback = widget.onLastNameChangedCallback;
    lastNameLabel = widget.lastNameLabel;
    showLastNameLabel = widget.showLastNameLabel ?? widget.showLabels;
    lastNameHint = widget.lastNameHint;
    showLastNameHint = widget.showLastNameHint ?? showHints;
    lastNameIcon = widget.lastNameIcon;
    showLastNameIcon = widget.showLastNameIcon ?? showIcons;
    
    tagline = widget.tagline;
    showTagline = widget.showTagline;
    canEditTagline = widget.canEditTagline;
    obscureTagline = widget.obscureTagline;
    onTaglineChangedCallback = widget.onTaglineChangedCallback;
    taglineLabel = widget.taglineLabel;
    showTaglineLabel = widget.showTaglineLabel ?? widget.showLabels;
    taglineHint = widget.taglineHint;
    showTaglineHint = widget.showTaglineHint ?? showHints;
    taglineIcon = widget.taglineIcon;
    showTaglineIcon = widget.showTaglineIcon ?? showIcons;
    
    pronouns = widget.pronouns;
    showPronouns = widget.showPronouns;
    canEditPronouns = widget.canEditPronouns;
    obscurePronouns = widget.obscurePronouns;
    onPronounsChangedCallback = widget.onPronounsChangedCallback;
    pronounsLabel = widget.pronounsLabel;
    showPronounsLabel = widget.showPronounsLabel ?? widget.showLabels;
    pronounsHint = widget.pronounsHint;
    showPronounsHint = widget.showPronounsHint ?? showHints;
    pronounsIcon = widget.pronounsIcon;
    showPronounsIcon = widget.showPronounsIcon ?? showIcons;
    
    organization = widget.organization;
    showOrganization = widget.showOrganization;
    canEditOrganization = widget.canEditOrganization;
    obscureOrganization = widget.obscureOrganization;
    onOrganizationChangedCallback = widget.onOrganizationChangedCallback;
    organizationLabel = widget.organizationLabel;
    showOrganizationLabel = widget.showOrganizationLabel ?? widget.showLabels;
    organizationHint = widget.organizationHint;
    showOrganizationHint = widget.showOrganizationHint ?? showHints;
    organizationIcon = widget.organizationIcon;
    showOrganizationIcon = widget.showOrganizationIcon ?? showIcons;
    
    address = widget.address;
    showAddress = widget.showAddress;
    canEditAddress = widget.canEditAddress;
    obscureAddress = widget.obscureAddress;
    onAddressChangedCallback = widget.onAddressChangedCallback;
    addressLabel = widget.addressLabel;
    showAddressLabel = widget.showAddressLabel ?? widget.showLabels;
    addressHint = widget.addressHint;
    showAddressHint = widget.showAddressHint ?? showHints;
    addressIcon = widget.addressIcon;
    showAddressIcon = widget.showAddressIcon ?? showIcons;
    
    city = widget.city;
    showCity = widget.showCity;
    canEditCity = widget.canEditCity;
    obscureCity = widget.obscureCity;
    onCityChangedCallback = widget.onCityChangedCallback;
    cityLabel = widget.cityLabel;
    showCityLabel = widget.showCityLabel ?? widget.showLabels;
    cityHint = widget.cityHint;
    showCityHint = widget.showCityHint ?? showHints;
    cityIcon = widget.cityIcon;
    showCityIcon = widget.showCityIcon ?? showIcons;
    
    state = widget.state;
    showState = widget.showState;
    canEditState = widget.canEditState;
    obscureState = widget.obscureState;
    onStateChangedCallback = widget.onStateChangedCallback;
    stateLabel = widget.stateLabel;
    showStateLabel = widget.showStateLabel ?? widget.showLabels;
    stateHint = widget.stateHint;
    showStateHint = widget.showStateHint ?? showHints;
    stateIcon = widget.stateIcon;
    showStateIcon = widget.showStateIcon ?? showIcons;
    
    zip = widget.zip;
    showZip = widget.showZip;
    canEditZip = widget.canEditZip;
    obscureZip = widget.obscureZip;
    onZipChangedCallback = widget.onZipChangedCallback;
    zipLabel = widget.zipLabel;
    showZipLabel = widget.showZipLabel ?? widget.showLabels;
    zipHint = widget.zipHint;
    showZipHint = widget.showZipHint ?? showHints;
    zipIcon = widget.zipIcon;
    showZipIcon = widget.showZipIcon ?? showIcons;
    
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
                    _buildStringField(canEditEmail, emailLabel, showEmailLabel, emailIcon, showEmailIcon, email, obscureEmail, emailHint, showEmailHint, onEmailChangedCallback,
                      validator: (value) => emailValidator(value, true)
                    ),
                    smallTransparentDivider
                  ],
                  if (showPassword) ... [
                    _buildStringField(canEditPassword, passwordLabel, showPasswordLabel, passwordIcon, showPasswordIcon, password, obscurePassword, passwordHint, showPasswordHint, onPasswordChangedCallback,
                      validator: (value) => passwordValidator(value, true),
                    ),
                    smallTransparentDivider
                  ],
                  if (showFirstName) ... [
                    _buildStringField(canEditFirstName, firstNameLabel, showFirstNameLabel, firstNameIcon, showFirstNameIcon, firstName, obscureFirstName, firstNameHint, showFirstNameHint, onFirstNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "First Name", true)),
                    smallTransparentDivider
                  ],
                  if (showLastName) ... [
                    _buildStringField(canEditLastName, lastNameLabel, showLastNameLabel, lastNameIcon, showLastNameIcon, lastName, obscureLastName, lastNameHint, showLastNameHint, onLastNameChangedCallback,
                      validator: (value) => nonEmptyValidator(value, "Last Name", true)),
                    smallTransparentDivider
                  ],
                  if (showTagline) ... [
                    _buildStringField(canEditTagline, taglineLabel, showTaglineLabel, taglineIcon, showTaglineIcon, tagline, obscureTagline, taglineHint, showTaglineHint, onTaglineChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showPronouns) ... [
                    _buildStringField(canEditPronouns, pronounsLabel, showPronounsLabel, pronounsIcon, showPronounsIcon, pronouns, obscurePronouns, pronounsHint, showPronounsHint, onPronounsChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showOrganization) ... [
                    _buildStringField(canEditOrganization, organizationLabel, showOrganizationLabel, organizationIcon, showOrganizationIcon, organization, obscureOrganization, organizationHint, showOrganizationHint, onOrganizationChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showAddress) ... [
                    _buildStringField(canEditAddress, addressLabel, showAddressLabel, addressIcon, showAddressIcon, address, obscureAddress, addressHint, showAddressHint, onAddressChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showCity) ... [
                    _buildStringField(canEditCity, cityLabel, showCityLabel, cityIcon, showCityIcon, city, obscureCity, cityHint, showCityHint, onCityChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showState) ... [
                    _buildStringField(canEditState, stateLabel, showStateLabel, stateIcon, showStateIcon, state, obscureState, stateHint, showStateHint, onStateChangedCallback),
                    smallTransparentDivider
                  ],
                  if (showZip) ... [
                    _buildStringField(canEditZip, zipLabel, showZipLabel, zipIcon, showZipIcon, zip, obscureZip, zipHint, showZipHint, onZipChangedCallback,
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

  Widget _buildStringField(
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
  ) {

    return isEditable && isEditMode
      ? ThemedEditableLabelValue(
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
          textAlign: textAlign,
          obscureText: obscureText,
          hintText: showHintText ? hintText : "",
          hintTextType: hintTextType,
          hintTextEmphasis: hintTextEmphasis,
          backgroundType: textFieldBackgroundType,
          onStringChangedCallback: onStringChangedCallback,
          validator: validator
        )
      : ThemedLabelValue(
          showLabel: showLabel,
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

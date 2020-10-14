import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/cards.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:provider/provider.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

//Intended to be a short list of equally distributed items with an image at the top
class HeaderList extends StatefulWidget {

  final Key key;
  final int headerFlex;
  final AlignmentGeometry headerAlignment;
  final String imageUrl;
  final BlendMode imageBlendMode;
  final Color imageBlendColor;
  final BackgroundGradientType headerGradientType;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry avatarPadding;
  final SimpleClipPath imageClipPath;
  final List<ListItemModel> listItems;
  final int itemsFlex;
  final EdgeInsetsGeometry listPadding;
  final ThemeGroupType cardType;
  final ElevationLevel cardElevationLevel;
  final ThemeGroupType leadingIconType;
  final Emphasis leadingEmphasis;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final ThemeGroupType subtitleType;
  final Emphasis subtitleEmphasis;
  final ThemeGroupType trailingIconType;
  final Emphasis trailingEmphasis;
  final bool isHeaderSticky;
  final bool isAvatarEnabled;
  final double heightBetween;
  final String avatarTitle;
  final ThemeGroupType avatarTitleType;
  final Emphasis avatarTitleEmphasis;
  final String avatarSubtitle;
  final ThemeGroupType avatarSubtitleType;
  final Emphasis avatarSubtitleEmphasis;
  final String avatarImageUrl;
  final double avatarImageBorderWidth;
  final double avatarImageRadius;
  final Function avatarClickedCallback;
  final bool usePolygonAvatar;

  //TODO - can use circular avatar and polygon clipper for the avatar shape
  //also look at https://pub.dev/packages/polygon_clipper

  HeaderList(
      this.listItems,
      {
        this.key,
        this.imageUrl,
        this.imageBlendColor,
        this.imageBlendMode,
        this.headerGradientType,
        this.headerPadding,
        this.avatarPadding,
        this.imageClipPath,
        this.headerFlex = 1,
        this.headerAlignment = AlignmentDirectional.bottomCenter,
        this.itemsFlex = 2,
        this.listPadding,
        this.cardType = ThemeGroupType.MOM,
        this.cardElevationLevel = ElevationLevel.FLAT,
        this.leadingIconType = ThemeGroupType.MOM,
        this.leadingEmphasis = Emphasis.NONE,
        this.titleType = ThemeGroupType.MOM,
        this.titleEmphasis = Emphasis.NONE,
        this.subtitleType = ThemeGroupType.MOM,
        this.subtitleEmphasis = Emphasis.NONE,
        this.trailingIconType = ThemeGroupType.MOM,
        this.trailingEmphasis = Emphasis.NONE,
        this.isHeaderSticky = true,
        this.isAvatarEnabled = true,
        this.heightBetween = 20.0,
        this.avatarTitle = "First Last Name",
        this.avatarTitleType = ThemeGroupType.POM,
        this.avatarTitleEmphasis = Emphasis.HIGH,
        this.avatarSubtitle = "Tag Line",
        this.avatarSubtitleType = ThemeGroupType.MOM,
        this.avatarSubtitleEmphasis = Emphasis.NONE,
        this.avatarImageUrl = "assets/female.png",
        this.avatarImageBorderWidth = 4.0,
        this.avatarImageRadius = 70.0,
        this.avatarClickedCallback,
        this.usePolygonAvatar = false
      }
  );

  @override
  _HeaderListState createState() => _HeaderListState(
    key,
    headerFlex,
    headerAlignment,
    imageUrl,
    imageBlendMode,
    imageBlendColor,
    headerGradientType,
    headerPadding,
    avatarPadding,
    imageClipPath,
    listItems,
    itemsFlex,
    listPadding,
    cardType,
    cardElevationLevel,
    leadingIconType,
    leadingEmphasis,
    titleType,
    titleEmphasis,
    subtitleType,
    subtitleEmphasis,
    trailingIconType,
    trailingEmphasis,
    isHeaderSticky,
    isAvatarEnabled,
    heightBetween,
    avatarTitle,
    avatarTitleType,
    avatarTitleEmphasis,
    avatarSubtitle,
    avatarSubtitleType,
    avatarSubtitleEmphasis,
    avatarImageUrl,
    avatarImageBorderWidth,
    avatarImageRadius,
    avatarClickedCallback,
    usePolygonAvatar
  );
}

class _HeaderListState extends State<HeaderList> {

  final Key key;
  final List<ListItemModel> listItems;
  final String imageUrl;
  final BlendMode imageBlendMode;
  final Color imageBlendColor;
  final BackgroundGradientType headerGradientType;
  EdgeInsetsGeometry headerPadding;
  EdgeInsetsGeometry avatarPadding;
  SimpleClipPath imageClipPath;
  final int headerFlex;
  final AlignmentGeometry headerAlignment;
  final int itemsFlex;
  EdgeInsetsGeometry listPadding;
  final ThemeGroupType cardType;
  final ElevationLevel cardElevationLevel;
  final ThemeGroupType leadingIconType;
  final Emphasis leadingEmphasis;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final ThemeGroupType subtitleType;
  final Emphasis subtitleEmphasis;
  final ThemeGroupType trailingIconType;
  final Emphasis trailingEmphasis;
  final bool isHeaderSticky;
  final bool isAvatarEnabled;
  final double heightBetween;
  final String avatarTitle;
  final ThemeGroupType avatarTitleType;
  final Emphasis avatarTitleEmphasis;
  final String avatarSubtitle;
  final ThemeGroupType avatarSubtitleType;
  final Emphasis avatarSubtitleEmphasis;
  final String avatarImageUrl;
  final double avatarImageBorderWidth;
  final double avatarImageRadius;
  final Function avatarClickedCallback;
  final bool usePolygonAvatar;

  _HeaderListState(
    this.key,
    this.headerFlex,
    this.headerAlignment,
    this.imageUrl,
    this.imageBlendMode,
    this.imageBlendColor,
    this.headerGradientType,
    this.headerPadding,
    this.avatarPadding,
    this.imageClipPath,
    this.listItems,
    this.itemsFlex,
    this.listPadding,
    this.cardType,
    this.cardElevationLevel,
    this.leadingIconType,
    this.leadingEmphasis,
    this.titleType,
    this.titleEmphasis,
    this.subtitleType,
    this.subtitleEmphasis,
    this.trailingIconType,
    this.trailingEmphasis,
    this.isHeaderSticky,
    this.isAvatarEnabled,
    this.heightBetween,
    this.avatarTitle,
    this.avatarTitleType,
    this.avatarTitleEmphasis,
    this.avatarSubtitle,
    this.avatarSubtitleType,
    this.avatarSubtitleEmphasis,
    this.avatarImageUrl,
    this.avatarImageBorderWidth,
    this.avatarImageRadius,
    this.avatarClickedCallback,
    this.usePolygonAvatar
  ){
    headerPadding = headerPadding != null ? headerPadding : EdgeInsets.all(0.0);

    avatarPadding = avatarPadding != null ? avatarPadding : EdgeInsets.all(0.0);

    listPadding = listPadding != null ? listPadding : EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0);

    imageClipPath = imageClipPath != null ? imageClipPath : SimpleClipPath(
        type: ClipPathType.DIAGONAL,
        bottomLeftPercentOfHeight: 80.0,
        bottomRightPercentOfHeight: 30.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHeaderSticky ? _createStickyHeaderList() : _createScrollView();
  }

  Widget _createStickyHeaderList() {
    return  Column(
      key: key,
      children: <Widget>[
        Flexible(
            flex: headerFlex,
            child: _createHeader()
        ),
        SizedBox(height: heightBetween),
        Flexible(
            flex: itemsFlex,
            child: _createList(false)
        ),
      ],
    );
  }

  Widget _createScrollView() {

    Size mediaQuery = MediaQuery.of(context).size;

    return SingleChildScrollView(
      key: key,
      child: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.height * headerFlex / (headerFlex + itemsFlex),
            child: _createHeader(),
          ),
          SizedBox(height: heightBetween),
          Container(
            child: _createList(true),
          )
        ]
      )
    );
  }

  Widget _createHeader() {

    var children = <Widget>[];

    if (imageUrl != null) {
      children.add(_createHeaderImage());
    }

    if (headerGradientType != null) {
      children.add(_createHeaderGradient());
    }

    //TODO - avatar
    if (isAvatarEnabled) {
      children.add(_createAvatar());
    }

    return Container(
      padding: headerPadding,
      child: Stack(
        alignment: headerAlignment,
        children: children
      ),
    );
  }

  Widget _createHeaderImage() {
    return ClipPath(
      child: Image(
        image: AssetImage(imageUrl),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
        colorBlendMode: imageBlendMode,
        color: imageBlendColor,
      ),
      clipper: imageClipPath,
    );
  }

  Widget _createHeaderGradient() {
    var opacities = imageUrl == null ? [1.0] : [0.8];
    return ClipPath(
      child: context.watch<MaterialThemesManager>().getBackgroundGradient(headerGradientType, opacities: opacities),
      clipper: imageClipPath,
    );
  }

  Widget _createAvatar() {
    return Container(
      padding: avatarPadding,
      child: GestureDetector(
        onTap: avatarClickedCallback,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            usePolygonAvatar ? _createPolygonAvatar() : _createCircularAvatar(),
            SizedBox(height: 4.0),
            ThemedTitle(avatarTitle, type: avatarTitleType, emphasis: avatarTitleEmphasis),
            ThemedSubTitle(avatarSubtitle, type: avatarSubtitleType, emphasis: avatarSubtitleEmphasis)
          ],
        ),
      ),
    );
  }

  Widget _createCircularAvatar() {
    return CircularProfileAvatar(
      '',
      child: Image(
        image: AssetImage(avatarImageUrl),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
      backgroundColor: context.watch<MaterialThemesManager>().colorPalette().primary,
      borderColor: context.watch<MaterialThemesManager>().colorPalette().primary,
      borderWidth: avatarImageBorderWidth,
      radius: avatarImageRadius,
    );
  }

  Widget _createPolygonAvatar() {
    return Container(
      width: avatarImageRadius * 2.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipPolygon(
            sides: 6,
            borderRadius: 5.0, // Default 0.0 degrees
            rotate: 90.0,
            child: Container(color: context.watch<MaterialThemesManager>().colorPalette().primary),
          ),
          Container(
            width: (avatarImageRadius - avatarImageBorderWidth) * 2.0,
            child: ClipPolygon(
              sides: 6,
              borderRadius: 5.0, // Default 0.0 degrees
              rotate: 90.0, // Default 0.0 degrees
              /*boxShadows: [
              PolygonBoxShadow(color: Colors.black, elevation: 1.0),
              PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
            ],*/
              child: Image(
                image: AssetImage(avatarImageUrl),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createList(bool isInScrollview) {
    return  ListView.builder(
      physics: isInScrollview ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Flexible(
          flex: 1,
          child: ThemedListTileCard(
            type: cardType,
            elevationLevel: cardElevationLevel,
            itemClickedCallback: listItems[index].itemClickedCallback,
            itemLongClickedCallback: listItems[index].itemLongClickedCallback,
            leadingIcon: listItems[index].leadingIcon,
            leadingType: leadingIconType,
            leadingEmphasis: leadingEmphasis,
            leadingIconClickedCallback: listItems[index].leadingIconClickedCallback,
            title: listItems[index].title,
            titleType: titleType,
            titleEmphasis: titleEmphasis,
            subtitle: listItems[index].subtitle,
            subtitleType: subtitleType,
            subtitleEmphasis: subtitleEmphasis,
            trailingIcon: listItems[index].trailingIcon,
            trailingType: trailingIconType,
            trailingEmphasis: trailingEmphasis,
            trailingIconClickedCallback: listItems[index].trailingIconClickedCallback,
          )
      ),
      shrinkWrap: true,
      itemCount: listItems.length,
      padding: listPadding,
    );
  }
}
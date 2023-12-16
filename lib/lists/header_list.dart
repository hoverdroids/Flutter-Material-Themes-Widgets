import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/cards.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:provider/provider.dart';

//Intended to be a short list of equally distributed items with an image at the top
class HeaderList extends StatefulWidget {

  final int headerFlex;
  final AlignmentGeometry headerAlignment;
  final String? imageUrl;
  final BlendMode? imageBlendMode;
  final Color? imageBlendColor;
  final BackgroundGradientType? headerGradientType;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? avatarPadding;
  final SimpleClipPath? imageClipPath;
  final List<ListItemModel> listItems;
  final int itemsFlex;
  final EdgeInsetsGeometry? listPadding;
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
  final double? heightBetween;
  final String avatarTitle;
  final ThemeGroupType avatarTitleType;
  final Emphasis avatarTitleEmphasis;
  final String avatarSubtitle;
  final ThemeGroupType avatarSubtitleType;
  final Emphasis avatarSubtitleEmphasis;
  final String avatarImageUrl;
  final double avatarImageBorderWidth;
  final double avatarImageRadius;
  final VoidCallback? avatarClickedCallback;
  final bool usePolygonAvatar;

  //TODO - can use circular avatar and polygon clipper for the avatar shape
  //also look at https://pub.dev/packages/polygon_clipper

  const HeaderList(
      this.listItems,
      {
        super.key,
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
  HeaderListState createState() => HeaderListState();
}

class HeaderListState extends State<HeaderList> {

  late final Key? key;
  late List<ListItemModel> listItems;
  late String? imageUrl;
  late BlendMode? imageBlendMode;
  late Color? imageBlendColor;
  late BackgroundGradientType? headerGradientType;
  late EdgeInsetsGeometry? headerPadding;
  late EdgeInsetsGeometry? avatarPadding;
  late SimpleClipPath? imageClipPath;
  late int headerFlex;
  late AlignmentGeometry headerAlignment;
  late int itemsFlex;
  late EdgeInsetsGeometry? listPadding;
  late ThemeGroupType cardType;
  late ElevationLevel cardElevationLevel;
  late ThemeGroupType leadingIconType;
  late Emphasis leadingEmphasis;
  late ThemeGroupType titleType;
  late Emphasis titleEmphasis;
  late ThemeGroupType subtitleType;
  late Emphasis subtitleEmphasis;
  late ThemeGroupType trailingIconType;
  late Emphasis trailingEmphasis;
  late bool isHeaderSticky;
  late bool isAvatarEnabled;
  late double? heightBetween;
  late String avatarTitle;
  late ThemeGroupType avatarTitleType;
  late Emphasis avatarTitleEmphasis;
  late String avatarSubtitle;
  late ThemeGroupType avatarSubtitleType;
  late Emphasis avatarSubtitleEmphasis;
  late String avatarImageUrl;
  late double avatarImageBorderWidth;
  late double avatarImageRadius;
  late VoidCallback? avatarClickedCallback;
  late bool usePolygonAvatar;

  HeaderListState(){
    key = widget.key;
    headerFlex = widget.headerFlex;
    headerAlignment = widget.headerAlignment;
    imageUrl = widget.imageUrl;
    imageBlendMode = widget.imageBlendMode;
    imageBlendColor = widget.imageBlendColor;
    headerGradientType = widget.headerGradientType;
    listItems = widget.listItems;
    itemsFlex = widget.itemsFlex;
    cardType = widget.cardType;
    cardElevationLevel = widget.cardElevationLevel;
    leadingIconType = widget.leadingIconType;
    leadingEmphasis = widget.leadingEmphasis;
    titleType = widget.titleType;
    titleEmphasis = widget.titleEmphasis;
    subtitleType = widget.subtitleType;
    subtitleEmphasis = widget.subtitleEmphasis;
    trailingIconType = widget.trailingIconType;
    trailingEmphasis = widget.trailingEmphasis;
    isHeaderSticky = widget.isHeaderSticky;
    isAvatarEnabled = widget.isAvatarEnabled;
    heightBetween = widget.heightBetween;
    avatarTitle = widget.avatarTitle;
    avatarTitleType = widget.avatarTitleType;
    avatarTitleEmphasis = widget.avatarTitleEmphasis;
    avatarSubtitle = widget.avatarSubtitle;
    avatarSubtitleType = widget.avatarSubtitleType;
    avatarSubtitleEmphasis = widget.avatarSubtitleEmphasis;
    avatarImageUrl = widget.avatarImageUrl;
    avatarImageBorderWidth = widget.avatarImageBorderWidth;
    avatarImageRadius = widget.avatarImageRadius;
    avatarClickedCallback = widget.avatarClickedCallback;
    usePolygonAvatar = widget.usePolygonAvatar;
    
    headerPadding = widget.headerPadding ?? const EdgeInsets.all(0.0);

    avatarPadding = widget.avatarPadding ?? const EdgeInsets.all(0.0);

    listPadding = widget.listPadding ?? const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0);

    imageClipPath = widget.imageClipPath ?? SimpleClipPath(
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
          SizedBox(
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

    Widget? widget;
    String? imgUrl = imageUrl;
    if (imgUrl != null && imgUrl.isNotEmpty) {
      widget = Image(
        image: AssetImage(imgUrl),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
        colorBlendMode: imageBlendMode,
        color: imageBlendColor,
      );
    }

    return ClipPath(
      clipper: imageClipPath,
      child: widget,
    );
  }

  Widget _createHeaderGradient() {
    var opacities = imageUrl == null ? [1.0] : [0.8];
    return ClipPath(
      clipper: imageClipPath,
      child: context.watch<MaterialThemesManager>().getBackgroundGradient(headerGradientType, opacities: opacities),
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
            const SizedBox(height: 4.0),
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
      backgroundColor: context.watch<MaterialThemesManager>().colorPalette().primary,
      borderColor: context.watch<MaterialThemesManager>().colorPalette().primary,
      borderWidth: avatarImageBorderWidth,
      radius: avatarImageRadius,
      child: Image(
        image: AssetImage(avatarImageUrl),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _createPolygonAvatar() {
    return SizedBox(
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
          SizedBox(
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
      physics: isInScrollview ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => ThemedListTileCard(
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
      ),
      shrinkWrap: true,
      itemCount: listItems.length,
      padding: listPadding,
    );
  }
}
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/cards.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

//Intended to be a short list of equally distributed items with an image at the top
class ScalingItemsList extends StatefulWidget {

  final int headerFlex;
  final AlignmentGeometry headerAlignment;
  final String imageUrl;
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

  //TODO - can use circular avatar and polygon clipper for the avatar shape
  //also look at https://pub.dev/packages/polygon_clipper

  ScalingItemsList(
      this.listItems,
      {
        this.imageUrl,
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
        this.heightBetween = 20.0
      }
  );

  @override
  _ScalingItemsListState createState() => _ScalingItemsListState(
      headerFlex,
      headerAlignment,
      imageUrl,
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
      heightBetween
  );
}

class _ScalingItemsListState extends State<ScalingItemsList> {

  final List<ListItemModel> listItems;
  final String imageUrl;
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

  _ScalingItemsListState(
      this.headerFlex,
      this.headerAlignment,
      this.imageUrl,
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
      this.heightBetween
  ){
    headerPadding = headerPadding != null ? headerPadding : EdgeInsets.all(0.0);

    avatarPadding = avatarPadding != null ? avatarPadding : EdgeInsets.all(0.0);

    listPadding = listPadding != null ? listPadding : EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0);

    imageClipPath = imageClipPath != null ? imageClipPath : SimpleClipPath(
        type: ClipPathType.DIAGONAL,
        leftPercentOfHeight: 80.0,
        rightPercentOfHeight: 30.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHeaderSticky ? _createStickyHeaderList() : _createScrollView();
  }

  Widget _createStickyHeaderList() {
    return  Column(
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

    //TODO - gradient

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
      ),
      clipper: imageClipPath,
    );
  }

  Widget _createHeaderGradient() {

  }

  Widget _createAvatar() {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: avatarPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProfileAvatar(
            '',
            child: Image(
              image: AssetImage("assets/female.png"),//TODO
              width: mediaQuery.width,
              height: 250,//TODO
              fit: BoxFit.fitHeight,
            ),
            backgroundColor: context.watch<MaterialThemesManager>().getTheme(cardType).cardTheme.color,
            borderColor: context.watch<MaterialThemesManager>().getTheme(cardType).cardTheme.color,
            borderWidth: 4.0,
            radius: 60.0,
          ),
          SizedBox(height: 4.0),
          Text(
            "Neecoder X",//TODO
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Developer",//TODO
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[700],
            ),
          ),
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
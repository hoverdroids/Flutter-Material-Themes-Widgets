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
  final String imageUrl;
  final double imagePadding;
  final ClipPathType clipPathType;
  final List<ListItemModel> listItems;
  final int itemsFlex;
  final double listPadding;
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

  //TODO - can use circular avatar and polygon clipper for the avatar shape
  //also look at https://pub.dev/packages/polygon_clipper

  ScalingItemsList(
      this.listItems,
      {
        this.imageUrl,
        this.imagePadding = 0.0,
        this.clipPathType = ClipPathType.NONE,
        this.headerFlex = 2,
        this.itemsFlex = 4,
        this.listPadding = 20.0,
        this.cardType = ThemeGroupType.MOM,
        this.cardElevationLevel = ElevationLevel.FLAT,
        this.leadingIconType = ThemeGroupType.MOM,
        this.leadingEmphasis = Emphasis.NONE,
        this.titleType = ThemeGroupType.MOM,
        this.titleEmphasis = Emphasis.NONE,
        this.subtitleType = ThemeGroupType.MOM,
        this.subtitleEmphasis = Emphasis.NONE,
        this.trailingIconType = ThemeGroupType.MOM,
        this.trailingEmphasis = Emphasis.NONE
      }
  );

  @override
  _ScalingItemsListState createState() => _ScalingItemsListState(
      headerFlex,
      imageUrl,
      imagePadding,
      clipPathType,
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
      trailingEmphasis
  );
}

class _ScalingItemsListState extends State<ScalingItemsList> {

  final List<ListItemModel> listItems;
  final String imageUrl;
  final double imagePadding;
  final ClipPathType clipPathType;
  final int headerFlex;
  final int itemsFlex;
  final double listPadding;
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

  _ScalingItemsListState(
      this.headerFlex,
      this.imageUrl,
      this.imagePadding,
      this.clipPathType,
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
      this.trailingEmphasis
  );

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300.0,//TODO
            child: Stack(
              children: <Widget>[
                ClipPath(
                  child: Image(
                    image: AssetImage(imageUrl),
                    width: mediaQuery.width,
                    height: 250,//TODO
                    fit: BoxFit.fitHeight,
                  ),
                  clipper: SimpleClipPath(type: clipPathType),
                ),
                Align(
                  alignment: Alignment(0, 1),
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
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
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
          )
        ],
      ),
    );
  }
}
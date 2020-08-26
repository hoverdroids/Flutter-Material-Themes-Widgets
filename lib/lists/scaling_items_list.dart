import 'package:flutter/material.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/lists/list_item_model.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_manager/material_themes_manager.dart';

//Intended to be a short list of equally distributed items with an image at the top
class ScalingItemsList extends StatefulWidget {

  final String imageUrl;
  final ClipPathType clipPathType;
  final List<ListItemModel> listItems;

  //TODO - image padding for boiler plate header image
  //also look at https://pub.dev/packages/polygon_clipper

  ScalingItemsList(this.imageUrl, this.listItems, {this.clipPathType = ClipPathType.ROUNDED_DOWN});

  @override
  _ScalingItemsListState createState() => _ScalingItemsListState(imageUrl, listItems, clipPathType);
}

class _ScalingItemsListState extends State<ScalingItemsList> {

  String imageUrl;
  ClipPathType clipPathType;
  List<ListItemModel> listItems;

  _ScalingItemsListState(this.imageUrl, this.listItems, this.clipPathType);

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;

    var children = <Widget>[];
    listItems.forEach((element) {
      var iconWidget = element.iconClickedCallback == null
        ? ThemedIcon(
            element.icon,
            type: ThemeGroupType.MOM,
          )
        : GestureDetector(
            onTap: element.iconClickedCallback,
            child: ThemedIcon(
              element.icon,
              type: ThemeGroupType.MOM,
            ),
          );

      var listItemWidget = Flexible(
          flex: 1,
          child: ListTile(
            leading: iconWidget,
            title: ThemedTitle(
              element.text,
              type: ThemeGroupType.MOM,
            ),
          )
      );
      children.add(listItemWidget);
    });

    return Container(
      height: mediaQuery.height,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ClipPath(
              child: Image(
                image: AssetImage(imageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              clipper: SimpleClipPath(type: clipPathType),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
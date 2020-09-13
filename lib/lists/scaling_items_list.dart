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
  final int headerFlex;
  final int itemsFlex;
  final ThemeGroupType type;

  //TODO - image padding for boiler plate header image
  //also look at https://pub.dev/packages/polygon_clipper

  ScalingItemsList(
      this.imageUrl,
      this.listItems,
      {
        this.clipPathType = ClipPathType.ROUNDED_DOWN,
        this.headerFlex = 2,
        this.itemsFlex = 4,
        this.type = ThemeGroupType.MOM,
      }
  );

  @override
  _ScalingItemsListState createState() => _ScalingItemsListState(imageUrl, listItems, clipPathType, headerFlex, itemsFlex, type);
}

class _ScalingItemsListState extends State<ScalingItemsList> {

  final String imageUrl;
  final ClipPathType clipPathType;
  final List<ListItemModel> listItems;
  final int headerFlex;
  final int itemsFlex;
  final ThemeGroupType type;

  _ScalingItemsListState(
      this.imageUrl,
      this.listItems,
      this.clipPathType,
      this.headerFlex,
      this.itemsFlex,
      this.type);

  Widget _createIconWidget(BuildContext context, ListItemModel model) {
    if (model.icon == null) {
      return null;

    } else if (model.itemClickedCallback == null) {
      return ThemedIcon(
          model.icon,
          type: type
      );

    } else {
      return GestureDetector(
        onTap: model.itemClickedCallback,
        child: ThemedIcon(
          model.icon,
          type: type,
        ),
      );
    }
  }

  Widget _createTextWidget(BuildContext context, ListItemModel model) {
    if (model.text == null) {
      return null;

    } else if (model.itemClickedCallback == null) {
      return ThemedTitle(
        model.text,
        type: type,
      );

    } else {
      return GestureDetector(
        onTap: model.itemClickedCallback,
        child: ThemedTitle(
          model.text,
          type: type,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;

    var children = <Widget>[];
    listItems.forEach((model) {

      var listItemWidget = Flexible(
          flex: 1,
          child: ListTile(
            leading: _createIconWidget(context, model),
            title: _createTextWidget(context, model),
          )
      );
      children.add(listItemWidget);
    });

    return Container(
      height: mediaQuery.height,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: headerFlex,
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
            flex: itemsFlex,
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
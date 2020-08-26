import 'package:flutter/material.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';

//Intended to be a short list of equally distributed items with an image at the top
class ScalingItemsList extends StatefulWidget {
  String imageUrl;
  ClipPathType clipPathType;
  //TODO - image padding for boiler plate header image
  //also look at https://pub.dev/packages/polygon_clipper

  ScalingItemsList(this.imageUrl, {this.clipPathType = ClipPathType.ROUNDED_DOWN});

  @override
  _ScalingItemsListState createState() => _ScalingItemsListState(imageUrl, clipPathType);
}

class _ScalingItemsListState extends State<ScalingItemsList> {

  String imageUrl;
  ClipPathType clipPathType;

  _ScalingItemsListState(this.imageUrl, this.clipPathType);

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: mediaQuery.height,
      width: 1200,
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
              children: [
                Text("Yo"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
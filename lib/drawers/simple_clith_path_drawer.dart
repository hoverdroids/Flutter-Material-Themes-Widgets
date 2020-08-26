import 'package:flutter/material.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';

class SimpleClipPathDrawer extends StatelessWidget {

  Widget child;
  final double padding;
  final ClipPathType clipPathType;

  SimpleClipPathDrawer({child, this.padding = 14.0, this.clipPathType = ClipPathType.BOILER_PLATE}) {
    this.child = child != null ? child : Container();//TODO - we can't pass null but can't instantiate the Container as a default because, "the default value of an optional param must be constant"
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        child: ClipPath(
          child: Drawer(
            child: child,
          ),
          clipper: SimpleClipPath(type: clipPathType),
        ),
        padding: EdgeInsets.all(padding),
      ),
    );
  }
}
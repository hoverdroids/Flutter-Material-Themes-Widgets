import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:provider/provider.dart';

class SimpleClipPathDrawer extends StatelessWidget {

  final Widget child;
  final double padding;
  final ClipPathType clipPathType;
  final BackgroundGradientType backgroundGradientType;

  SimpleClipPathDrawer({
    this.child,
    this.padding = paddingSmall,
    this.clipPathType = ClipPathType.BOILER_PLATE,
    this.backgroundGradientType = BackgroundGradientType.MAIN_BG,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        child: ClipPath(
          child: Drawer(
            child: Stack(
              children: [
                context.watch<MaterialThemesManager>().getBackgroundGradient(backgroundGradientType),
                child != null ? child : Container(),
              ],
            ),
          ),
          clipper: SimpleClipPath(type: clipPathType),
        ),
        padding: EdgeInsets.all(padding),
      ),
    );
  }
}
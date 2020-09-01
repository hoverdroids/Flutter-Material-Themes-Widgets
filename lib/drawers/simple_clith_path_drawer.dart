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
  final double width;
  final double widthPercent;
  //TODO - show tab or a number of pixels when closed, to indicate a drawer exists

  SimpleClipPathDrawer({
    this.child,
    this.padding = paddingSmall,
    this.clipPathType = ClipPathType.BOILER_PLATE,
    this.backgroundGradientType = BackgroundGradientType.MAIN_BG,
    this.width,
    this.widthPercent = 0.70
  });

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double calculatedWidth = mediaQuery.width * widthPercent;

    return Container(
      width: width != null ? width : calculatedWidth,
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
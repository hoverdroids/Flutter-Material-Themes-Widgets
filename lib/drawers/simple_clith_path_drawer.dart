import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/defaults/dimens.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:provider/provider.dart';

class SimpleClipPathDrawer extends StatelessWidget {

  final Widget child;
  final double padding;
  final ClipPathType clipPathType;
  final BackgroundGradientType backgroundGradientType;
  final double width;
  final double widthPercent;
  final bool showAppBar;
  final IconData leftIcon;
  final bool showLeftIcon;
  final Function leftIconClickedCallback;
  final ThemeGroupType leftIconType;
  final Emphasis leftIconEmphasis;
  final IconData rightIcon;
  final bool showRightIcon;
  final Function rightIconClickedCallback;
  final ThemeGroupType rightIconType;
  final Emphasis rightIconEmphasis;
  //TODO - show tab or a number of pixels when closed, to indicate a drawer exists

  SimpleClipPathDrawer({
    this.child,
    this.padding = paddingSmall,
    this.clipPathType = ClipPathType.BOILER_PLATE,
    this.backgroundGradientType = BackgroundGradientType.MAIN_BG,
    this.width,
    this.widthPercent = 0.70,
    this.showAppBar = true,
    this.leftIcon = Icons.arrow_back,
    this.showLeftIcon = true,
    this.leftIconClickedCallback,
    this.leftIconType = ThemeGroupType.MOM,
    this.leftIconEmphasis = Emphasis.HIGH,
    this.rightIcon = Icons.account_circle,
    this.showRightIcon = true,
    this.rightIconClickedCallback,
    this.rightIconType = ThemeGroupType.MOM,
    this.rightIconEmphasis = Emphasis.HIGH
  });

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double calculatedWidth = mediaQuery.width * widthPercent;

    Widget _getAppBar() {
      return SafeArea(
        child: Row(
          mainAxisAlignment: showLeftIcon && showRightIcon ? MainAxisAlignment.spaceBetween : (showLeftIcon ? MainAxisAlignment.start : MainAxisAlignment.end),
          children: <Widget>[
            if (showLeftIcon) ... [
              ThemedIconButton(
                leftIcon,
                type: leftIconType,
                emphasis: leftIconEmphasis,
                onPressedCallback: leftIconClickedCallback,
              )
            ],
            if(showRightIcon) ... [
              ThemedIconButton(
                rightIcon,
                type: rightIconType,
                emphasis: rightIconEmphasis,
                onPressedCallback: rightIconClickedCallback,
              )
            ]
          ],
        ),
      );
    }

    return Container(
      width: width != null ? width : calculatedWidth,
      child: Padding(
        child: ClipPath(
          child: Drawer(
            child: Stack(
              children: [
                context.watch<MaterialThemesManager>().getBackgroundGradient(backgroundGradientType),
                if(child != null) ... [ child ],
                if(showAppBar) ... [ _getAppBar() ]
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
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/appbars/icon_title_icon_fake_appbar.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:provider/provider.dart';

class SimpleClipPathDrawer extends StatelessWidget {

  final Widget? child;
  final EdgeInsets padding;
  final ClipPathType clipPathType;
  final BackgroundGradientType backgroundGradientType;
  final double? width;
  final double widthPercent;
  final bool showAppBar;
  
  final IconData leftIcon;
  final bool showLeftIcon;
  final VoidCallback? leftIconClickedCallback;
  final ThemeGroupType leftIconType;
  final Emphasis leftIconEmphasis;

  final String title;
  final bool showTitle;
  final VoidCallback? titleClickedCallback;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final TextAlign titleTextAlign;
  
  final IconData rightIcon;
  final bool showRightIcon;
  final VoidCallback? rightIconClickedCallback;
  final ThemeGroupType rightIconType;
  final Emphasis rightIconEmphasis;

  final Color appBarBackgroundColor;
  final double appBarElevation;
  final ShapeBorder appbarShape;

  final bool enableAppbarSafeArea;

  //TODO - show tab or a number of pixels when closed, to indicate a drawer exists

  SimpleClipPathDrawer({
    this.child,
    this.padding = const EdgeInsets.all(0.0),
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
    this.title = "",
    this.showTitle = true,
    this.titleClickedCallback,
    this.titleType = ThemeGroupType.MOM,
    this.titleEmphasis = Emphasis.HIGH,
    this.titleTextAlign = TextAlign.center,
    this.rightIcon = Icons.account_circle,
    this.showRightIcon = true,
    this.rightIconClickedCallback,
    this.rightIconType = ThemeGroupType.MOM,
    this.rightIconEmphasis = Emphasis.HIGH,
    this.appBarBackgroundColor = Colors.transparent,
    this.appBarElevation = 0.0,
    this.appbarShape = const RoundedRectangleBorder(),
    this.enableAppbarSafeArea = true
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
                if(child != null) ... [ child! ],
                if(showAppBar) ... [ 
                  IconTitleIconFakeAppBar(
                    leftIcon: leftIcon,
                    showLeftIcon: showLeftIcon,
                    leftIconClickedCallback: leftIconClickedCallback,
                    leftIconType: leftIconType,
                    leftIconEmphasis: leftIconEmphasis,
                    title: title,
                    showTitle: showTitle,
                    titleClickedCallback: titleClickedCallback,
                    titleType: titleType,
                    titleEmphasis: titleEmphasis,
                    titleTextAlign: titleTextAlign,
                    rightIcon: rightIcon,
                    showRightIcon: showRightIcon,
                    rightIconClickedCallback: rightIconClickedCallback,
                    rightIconType: rightIconType,
                    rightIconEmphasis: rightIconEmphasis,
                    backgroundColor: appBarBackgroundColor,
                    elevation: appBarElevation,
                    shape: appbarShape,
                    enableSafeArea: enableAppbarSafeArea,
                  )
                ]
              ],
            ),
          ),
          clipper: SimpleClipPath(type: clipPathType),
        ),
        padding: padding,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';

class IconTitleIconFakeAppBar extends StatelessWidget {

  final IconData leftIcon;
  final bool showLeftIcon;
  final Function leftIconClickedCallback;
  final ThemeGroupType leftIconType;
  final Emphasis leftIconEmphasis;

  final String title;
  final bool showTitle;
  final Function titleClickedCallback;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final TextAlign titleTextAlign;

  final IconData rightIcon;
  final bool showRightIcon;
  final Function rightIconClickedCallback;
  final ThemeGroupType rightIconType;
  final Emphasis rightIconEmphasis;

  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;

  final bool enableSafeArea;

  IconTitleIconFakeAppBar({
    this.leftIcon = Icons.menu,
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
    this.backgroundColor = Colors.transparent,
    this.elevation = 0.0,
    this.shape = const RoundedRectangleBorder(),
    this.enableSafeArea = true
  });

  @override
  Widget build(BuildContext context) {
    if(enableSafeArea) {
      return SafeArea(child: _buildAppbar());
    } else {
      return _buildAppbar();
    }
  }

  Widget _buildAppbar() {
    return /*Card(
          shape: shape,
          color: backgroundColor != null ? backgroundColor : Colors.transparent,
          elevation: elevation,*/
          Center(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.,
            //mainAxisAlignment: showLeftIcon && showRightIcon || showTitle && showRightIcon ? MainAxisAlignment.spaceBetween : (showLeftIcon ? MainAxisAlignment.start : MainAxisAlignment.end),
            children: <Widget>[
              if (showLeftIcon) ... [
                ThemedIconButton(
                  leftIcon,
                  type: leftIconType,
                  emphasis: leftIconEmphasis,
                  onPressedCallback: leftIconClickedCallback,
                )
              ],
              if (showTitle) ... [
                //GestureDetector(
                  //onTap: titleClickedCallback,
                  //child: Flexible(
                    //flex: 1,
                    //child: Row(
                    //  children: [
                        //child:
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 20,
                            //width: 200,
                            color: Colors.red,
                            /*child:
                            ThemedTitle(
                              title,
                              type: titleType,
                              emphasis: titleEmphasis,
                              textAlign: titleTextAlign,
                              //TODO - onTapTitle
                              ),*/
                          ),
                        )
                      //],
                    //),
                  //),
                //)
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
}
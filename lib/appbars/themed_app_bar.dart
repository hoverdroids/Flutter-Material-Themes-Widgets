import 'package:flutter/material.dart';

//TODO - Appbar is a bit harder, try again later
/*class ThemedAppBar extends AppBar {
  //TODO type = ThemeGroupType.POM,

  ThemedAppBar(
  {
    key,
    leading,
    automaticallyImplyLeading,
    title,
    actions,
    flexibleSpace,
    bottom,
    elevation,
    shape,
    backgroundColor,
    brightness,
    iconTheme,
    actionsIconTheme,
    textTheme,
    primary,
    centerTitle,
    excludeHeaderSemantics,
    titleSpacing,
    toolbarOpacity,
    bottomOpacity,}

      ) : super(key: key,
leading: leading,
automaticallyImplyLeading: automaticallyImplyLeading,
title: title,
actions: actions,
flexibleSpace: flexibleSpace,
bottom: bottom,
elevation: elevation,
shape: shape,
backgroundColor: backgroundColor,
brightness: brightness,
iconTheme: iconTheme,
actionsIconTheme: actionsIconTheme,
textTheme: textTheme,
primary: primary,
centerTitle: centerTitle,
excludeHeaderSemantics: excludeHeaderSemantics,
titleSpacing: titleSpacing,
toolbarOpacity: toolbarOpacity,
bottomOpacity: bottomOpacity,);

  @override
  Widget build(BuildContext context) {
    var appBar = super.build(context);
  }
}*/

/*class ThemedAppBar extends PreferredSizeWidget {

  //TODO - add all of the fields
  final ThemeGroupType type;
  final Key key;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;

  ThemedAppBar(
      {
        this.type = ThemeGroupType.POM,
        this.key,
        this.leading,
        this.automaticallyImplyLeading,
        this.title,
        this.actions,
        this.flexibleSpace,
        this.bottom,
        this.elevation,
        this.shape,
        this.backgroundColor,
        this.brightness,
        this.iconTheme,
        this.actionsIconTheme,
        this.textTheme,
        this.primary,
        this.centerTitle,
        this.excludeHeaderSemantics,
        this.titleSpacing,
        this.toolbarOpacity,
        this.bottomOpacity,
      }
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager> (
      builder: (context, themeManager, child) {
        //getTextStyle(themeManager.getTheme(type)),
        return AppBar(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
      }
    );
  }
}*/
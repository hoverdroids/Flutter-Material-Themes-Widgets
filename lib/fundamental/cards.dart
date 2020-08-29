import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedCard2 extends Card {
  ThemedCard2({child}) : super(child: child);
}

class ThemedCard3 extends StatelessWidget {

  final ThemeGroupType type;
  final Widget child;

  ThemedCard3({this.child, this.type = ThemeGroupType.MOM});

  @override
  Widget build(BuildContext context) {
    //return Consumer<MaterialThemesManager>(
     // builder: (context, themeManager, child) {
        return Container(
          child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //TODO - extend the ThemeData so we can use gradients
                        Colors.blueAccent,//Provider.of<MaterialThemesManager>(context).getTheme(type).cardTheme.color,
                        context.watch<MaterialThemesManager>().getTheme(type).cardTheme.color,
                      ],
                    ),
                  ),
                ),
                Card(child: child)
              ]
          ),
        );
      //},
    //);
  }
}

class ThemedCard extends StatelessWidget {

  final Key key;
  final ThemeGroupType type;
  final Color shadowColor;
  final double elevation;
  final ShapeBorder shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry margin;
  final Clip clipBehavior;
  final Widget child;
  final bool semanticContainer;
  
  ThemedCard({
    this.key,
    this.type = ThemeGroupType.MOM,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
  });
  
  @override
  Widget build(BuildContext context) {

    //construct a default widget in order to fall back on default values when the optional params aren't passed
    var defaultCard = Card();

    return Consumer<MaterialThemesManager>(
      builder: (context, themeManager, child) {
        return Card(
          //key: key != null ? key : defaultCard.key,
          color: themeManager.getTheme(type).cardTheme.color,
          //shadowColor: shadowColor != null ? shadowColor : defaultCard.shadowColor,
          //elevation: elevation != null ? elevation : defaultCard.elevation,
          //shape: shape != null ? shape : defaultCard.shape,
          //borderOnForeground: borderOnForeground != null ? borderOnForeground : defaultCard.borderOnForeground,
          //margin: margin != null ? margin : defaultCard.margin,
          //clipBehavior: clipBehavior != null ? clipBehavior : defaultCard.clipBehavior,
          child: child != null ? child : defaultCard.child,
          //semanticContainer: semanticContainer != null ? semanticContainer : defaultCard.semanticContainer,
        );
      },
    );
  }
}
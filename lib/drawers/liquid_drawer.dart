import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class ThemedLiquidDrawer extends StatelessWidget {
  final Widget? content;
  final double? percentOfWidth;
  final int? archHeight;
  final bool? showCurvedByDefault;
  final Paint? paint;
  final Color? startColor;
  final Color? endColor;

  const ThemedLiquidDrawer({
    super.key,
    this.content,
    this.percentOfWidth,
    this.archHeight,
    this.showCurvedByDefault,
    this.paint,
    this.startColor,
    this.endColor
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialThemesManager> (
      builder: (context, themeManager, child) {
        //Construct a default widget in order to fall back on default values when the optional params aren't passed
        var defaultLiquidDrawer = const LiquidDrawer();
      
        return LiquidDrawer(
            content: content ?? defaultLiquidDrawer.content,
            percentOfWidth: percentOfWidth ?? defaultLiquidDrawer.percentOfWidth,
            archHeight: archHeight ?? defaultLiquidDrawer.archHeight,
            showCurvedByDefault: showCurvedByDefault ?? defaultLiquidDrawer.showCurvedByDefault,
            paint: paint ?? defaultLiquidDrawer.paint,
            startColor: startColor ?? defaultLiquidDrawer.startColor,
            endColor: endColor ?? defaultLiquidDrawer.endColor
        );
      });
  }
}

//Derived from: https://www.youtube.com/watch?v=1KurAaGLwHc&t=1602s
class LiquidDrawer extends StatefulWidget {

  final Widget? content;
  final double percentOfWidth;
  final int archHeight;
  final bool showCurvedByDefault;
  final Paint? paint;
  final Color startColor;
  final Color endColor;

  const LiquidDrawer({
    super.key,
    this.content,
    this.percentOfWidth = 0.70,
    this.archHeight = 75,
    this.showCurvedByDefault = true,
    this.paint,
    this.startColor = Colors.white,
    this.endColor = Colors.white
  });

  @override
  LiquidDrawerState createState() => LiquidDrawerState();
}

class LiquidDrawerState extends State<LiquidDrawer> {

  late Widget child;
  late double percentOfWidth;
  late int archHeight;
  late bool showCurvedByDefault;
  late Paint? paint;
  late Color startColor;
  late Color endColor;

  LiquidDrawerState();

  GlobalKey globalKey = GlobalKey();//TODO - does this need a more descriptive name?
  Offset _offset = const Offset(0,0);
  List<double> limits = [0,0,0,0,0,0];
  bool isScrolling = false;

  @override
  void initState() {
    child = widget.content ?? Container();//TODO - we can't pass null but can't instantiate the Container as a default because, "the default value of an optional param must be constant"
    percentOfWidth = widget.percentOfWidth;
    archHeight = widget.archHeight;
    showCurvedByDefault = widget.showCurvedByDefault;
    paint = widget.paint;
    startColor = widget.startColor;
    endColor = widget.endColor;

    limits= [0, 0, 0, 0, 0, 0];
    isScrolling = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * percentOfWidth;//TODO - the drawer is always the same width percent

    //Build is called each time the paint redraws and hence this offset will override the previous offset that was set in onPanUpdate.
    //So, to start out with a curve while still allowing the user's motion to move the curve, we must add the following check
    if(!isScrolling) {
      var initialDx = showCurvedByDefault ? sidebarSize + archHeight.toDouble() : 0.0;
      var initialDy = showCurvedByDefault ? mediaQuery.height/2 : 0.0;
      _offset = Offset(initialDx, initialDy);
    }

    return SizedBox(
      width: sidebarSize,
      child: Drawer(
        child: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState((){
                isScrolling = true;
                _offset = details.localPosition;
              });
            },
            onPanEnd: (details) {
              setState(() {
                isScrolling = false;
                var finalDx = showCurvedByDefault ? sidebarSize + archHeight.toDouble() : 0.0;
                var finalDy = showCurvedByDefault ? mediaQuery.height/2 : 0.0;
                _offset = Offset(finalDx, finalDy);
              });
            },
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size(sidebarSize, mediaQuery.height),
                  painter: DrawerPainter(offset: _offset, archHeight: archHeight, paint: getPaint(sidebarSize, mediaQuery.height), showCurvedByDefault: showCurvedByDefault),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Paint getPaint(double width, double height) => paint ?? createLinearGradient(width, height);

  Paint createLinearGradient(double width, double height) {
    //TODO - maybe make it easier to pass specific gradient fields vs making your own gradient
    //https://stackoverflow.com/questions/60019684/use-gradient-with-paint-object-in-flutter-canvas
    return Paint()..shader =
    LinearGradient(colors: [startColor, endColor], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromLTRB(0, 0, width, height));
  }
}

class DrawerPainter extends CustomPainter {

  final int archHeight;
  final Offset offset;
  Paint customPaint = Paint()..color = Colors.white..style = PaintingStyle.fill;
  bool showCurvedByDefault;

  DrawerPainter({
    required this.offset,
    required this.archHeight,
    paint,
    required this.showCurvedByDefault
  }) {
    customPaint = paint ?? customPaint;
  }

  double getControlPointX(double width) {
    if(showCurvedByDefault) {
      return width + archHeight;
    } else if (offset.dx <= width) {
      return width;
    } else if (offset.dx >= width + archHeight) {
      return width + archHeight;
    } else {
      return offset.dx;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width-200, 0);
    path.quadraticBezierTo(getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, customPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
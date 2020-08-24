import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';

//Derived from: https://www.youtube.com/watch?v=1KurAaGLwHc&t=1602s
class ElasticDrawer extends StatefulWidget {

  final Widget content;
  final double percentOfWidth;
  final double pixelsShownWhenClosed;
  final int archHeight;
  final bool showCurvedByDefault;
  final Paint paint;
  final Color startColor;
  final Color endColor;

  ElasticDrawer({
    this.content,
    this.percentOfWidth = 0.70,
    this.pixelsShownWhenClosed = 0.0,
    this.archHeight = 75,
    this.showCurvedByDefault = true,
    this.paint,
    this.startColor = Colors.white,
    this.endColor = Colors.white
  });

  @override
  _ElasticDrawerState createState() => _ElasticDrawerState(
    content: content != null ? content : Container(),//TODO - we can't pass null but can't instantiate the Container as a default because, "the default value of an optional param must be constant"
    percentOfWidth: percentOfWidth,
    pixelsShownWhenClosed: pixelsShownWhenClosed,
    archHeight: archHeight,
    showCurvedByDefault: showCurvedByDefault,
    paint: paint,
    startColor: startColor,
    endColor: endColor
  );
}

class _ElasticDrawerState extends State<ElasticDrawer> {

  final Widget content;
  final double percentOfWidth;
  final int animationDuration;
  final double pixelsShownWhenClosed;
  final int archHeight;
  final bool showCurvedByDefault;
  final Paint paint;
  final Color startColor;
  final Color endColor;

  _ElasticDrawerState({
    this.content,
    this.percentOfWidth,
    this.animationDuration,
    this.pixelsShownWhenClosed,
    this.archHeight,
    this.showCurvedByDefault,
    this.paint,
    this.startColor,
    this.endColor,
  });

  GlobalKey globalKey = GlobalKey();//TODO - does this need a more descriptive name?
  Offset _offset = Offset(0,0);
  List<double> limits = [0,0,0,0,0,0];

  bool isScrolling = false;

  @override
  void initState() {
    limits= [0, 0, 0, 0, 0, 0];
    isScrolling = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * percentOfWidth;//TODO - the drawer is always the same width percent!

    //Build is called each time the paint redraws and hence this offset will override the previous offset that was set in onPanUpdate.
    //So, to start out with a curve while still allowing the user's motion to move the curve, we must add the following check
    if(!isScrolling) {
      var initialDx = showCurvedByDefault ? sidebarSize + archHeight.toDouble() : 0.0;
      var initialDy = showCurvedByDefault ? mediaQuery.height/2 : 0.0;
      _offset = Offset(initialDx, initialDy);
    }

    return Container(
      width: sidebarSize,
      child: Drawer(
          child: SizedBox(
            width: double.infinity,
            child: GestureDetector(//TODO - swipe left to close
              onPanUpdate: (details) {
                setState((){
                  isScrolling = true;
                  _offset = details.localPosition;
                  print("Offset: $_offset sidebarSize:$sidebarSize");
                });
              },
              onPanEnd: (details) {
                setState(() {
                  isScrolling = false;
                  var finalDx = showCurvedByDefault ? sidebarSize + archHeight.toDouble() : 0;
                  var finalDy = showCurvedByDefault ? mediaQuery.height/2 : 0;
                  _offset = Offset(finalDx, finalDy);
                });
              },
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    size: Size(sidebarSize, mediaQuery.height),
                    painter: DrawerPainter(offset: _offset, archHeight: archHeight, paint: getPaint(sidebarSize, mediaQuery.height)),
                  ),
                  content,
                ],
              ),
            ),
          ),
        ),
    );
  }

  Paint getPaint(double width, double height) {
    if (paint != null) {
      return paint;
    } else {
      //TODO - maybe make it easier to pass specific gradient fields vs making your own gradient
      //https://stackoverflow.com/questions/60019684/use-gradient-with-paint-object-in-flutter-canvas
      return Paint()..shader =
        LinearGradient(colors: [startColor, endColor], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromLTRB(0, 0, width, height));
    }
  }
}

class DrawerPainter extends CustomPainter {

  final int archHeight;
  final Offset offset;
  Paint customPaint;

  DrawerPainter({this.offset, this.archHeight, paint}) {
      customPaint = paint != null ? paint : Paint()..color = Colors.white..style = PaintingStyle.fill;
  }

  double getControlPointX(double width) {
    if (offset.dx <= width) {
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
    path.lineTo(size.width, 0);
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
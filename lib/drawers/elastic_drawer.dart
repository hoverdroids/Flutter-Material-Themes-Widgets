import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

//Derived from: https://www.youtube.com/watch?v=1KurAaGLwHc&t=1602s
class ElasticDrawer extends StatefulWidget {

  final Widget content;
  final double percentOfWidth;
  final int animationDuration;
  final double pixelsShownWhenClosed;
  final int archHeight;
  final bool isAlwaysArched;

  ElasticDrawer({
    this.content,
    this.percentOfWidth = 0.70,
    this.animationDuration = 1500,
    this.pixelsShownWhenClosed = 0.0,
    this.archHeight = 75,
    this.isAlwaysArched});

  @override
  _ElasticDrawerState createState() => _ElasticDrawerState(
    content: content != null ? content : Container(),//TODO - we can't pass null but can't instantiate the Container as a default because, "the default value of an optional param must be constant"
    percentOfWidth: percentOfWidth,
    animationDuration: animationDuration,
    pixelsShownWhenClosed: pixelsShownWhenClosed,
    archHeight: archHeight);
}

class _ElasticDrawerState extends State<ElasticDrawer> {

  final Widget content;
  final double percentOfWidth;
  final int animationDuration;
  final double pixelsShownWhenClosed;
  final int archHeight;
  final bool isAlwaysArched;

  _ElasticDrawerState({this.content, this.percentOfWidth, this.animationDuration, this.pixelsShownWhenClosed, this.archHeight, this.isAlwaysArched});

  GlobalKey globalKey = GlobalKey();//TODO - does this need a more descriptive name?
  bool isMenuOpen = false;
  Offset _offset = Offset(0,0);
  List<double> limits = [0,0,0,0,0,0];

  @override
  void initState() {
    limits= [0, 0, 0, 0, 0, 0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * percentOfWidth;
    double menuContainerHeight = mediaQuery.height / 2;

    return Container(
      width: sidebarSize,
      child: Drawer(
        child: AnimatedPositioned(
          duration: Duration(milliseconds: animationDuration),
          left: isMenuOpen ? 0 : -sidebarSize + pixelsShownWhenClosed,
          top: 0,
          curve: Curves.elasticOut,
          child: SizedBox(//TODO - change this to a scrollView
            width:sidebarSize,
            child: GestureDetector(//TODO - swipe left to close
              onPanUpdate: (details) {
                if(details.localPosition.dx <= sidebarSize) {
                  setState((){
                    _offset = details.localPosition;
                  });
                }

                if(details.localPosition.dx>sidebarSize - pixelsShownWhenClosed && details.delta.distanceSquared > 2){
                  setState(() {
                    isMenuOpen = true;
                  });
                }
              },
              onPanEnd: (details) {
                setState(() {
                  _offset = Offset(0,0);
                });
              },
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    size: Size(sidebarSize, mediaQuery.height),
                    painter: DrawerPainter(offset: _offset, archHeight: archHeight),
                  ),
                  content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {

  final int archHeight;
  final Offset offset;

  DrawerPainter({ this.offset, this.archHeight });

  double getControlPointX(double width) {
    if(offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + archHeight;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
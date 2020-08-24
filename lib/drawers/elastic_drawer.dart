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
  //final double defaultArchX;
  //final double defaultArchY;

  _ElasticDrawerState({this.content, this.percentOfWidth, this.animationDuration, this.pixelsShownWhenClosed, this.archHeight, this.isAlwaysArched});

  GlobalKey globalKey = GlobalKey();//TODO - does this need a more descriptive name?
  Offset _offset = Offset(0,0);
  List<double> limits = [0,0,0,0,0,0];

  bool firstBuild = true;

  @override
  void initState() {
    limits= [0, 0, 0, 0, 0, 0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Buld");
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * percentOfWidth;//TODO - the drawer is always the same width percent!

    //Build is called each time the paint redraws and hence this offset will override the previous offset that was set in onPanUpdate.
    //So, to start out with a curve while still allowing the user's motion to move the curve, we must add the following check
    if(firstBuild) {
      firstBuild = false;
      _offset = Offset(sidebarSize + archHeight.toDouble(), mediaQuery.height/2);
      //_offset = Offset(0, 0);
    }

    return Container(
      width: sidebarSize,
      child: Drawer(
          //width:sidebarSize/2,
         // height: double.infinity,
          child: SizedBox(
            width: double.infinity,
            child: GestureDetector(//TODO - swipe left to close
              onPanUpdate: (details) {
                //if(details.localPosition.dx >= sidebarSize && details.localPosition.dx <= sidebarSize + archHeight) {
                  setState((){
                    _offset = details.localPosition;
                    print("Offset: $_offset sidebarSize:$sidebarSize");
                  });
                //}
              },
              onPanEnd: (details) {
                setState(() {
                  //_offset = Offset(0,0);
                  _offset = Offset(sidebarSize + archHeight.toDouble(), mediaQuery.height/2);
                });
              },
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    size: Size(sidebarSize, mediaQuery.height),
                    painter: DrawerPainter(offset: _offset, archHeight: archHeight),
                  ),
                  Text("yo"),
                ],
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
    /*if(offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + archHeight;
    }*/
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
    print("Painting dx:${offset.dx} dy:${offset.dy}");
    Paint paint = Paint()..color = Colors.red..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
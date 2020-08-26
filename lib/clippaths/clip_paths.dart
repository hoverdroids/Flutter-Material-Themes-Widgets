import 'package:flutter/material.dart';

//Derived from: https://www.developerlibs.com/2019/08/flutter-draw-custom-shaps-clip-path.html
enum ClipPathType {
  ROUNDED_DOWN,
  ROUNDED_UP,
  TRIANGLE_DOWN,
  WAVE,
  JAGGED,
  CLOUDS,
  BOILER_PLATE
}

class SimpleClipPath extends CustomClipper<Path> {

  ClipPathType type;
  double radius;

  SimpleClipPath({this.type = ClipPathType.ROUNDED_DOWN, this.radius = 10.0});

  @override
  Path getClip(Size size) {
    switch(type) {
      case ClipPathType.ROUNDED_DOWN:
        return getRoundedDown(size);
      case ClipPathType.ROUNDED_UP:
        return getRoundedUp(size);
      case ClipPathType.TRIANGLE_DOWN:
        return getTriangleDown(size);
      case ClipPathType.WAVE:
        return getWave(size);
      case ClipPathType.JAGGED:
        return getJagged(size);
      case ClipPathType.CLOUDS:
        return getClouds(size);
      default:
        return getBoilerPlate(size);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  Path getRoundedDown(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  Path getRoundedUp(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  Path getTriangleDown(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  Path getWave(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;
  }

  Path getJagged(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 40;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 30 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
    return path;
  }

  Path getClouds(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 20;
    while (curXPos < size.width) {
      curXPos += increment;
      path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(5));
    }
    path.lineTo(size.width, 0);
    return path;
  }

  Path getBoilerPlate(Size size) {
    Path path = Path();
    path.moveTo(radius, 0.0);
    path.arcToPoint(Offset(0.0, radius),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0.0, size.height - radius);
    path.arcToPoint(Offset(radius, size.height),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width - radius, size.height);
    path.arcToPoint(Offset(size.width, size.height - radius),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width, radius);
    path.arcToPoint(Offset(size.width - radius, 0.0),
        clockwise: true, radius: Radius.circular(radius));
    return path;
  }
}
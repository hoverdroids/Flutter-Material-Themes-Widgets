import 'package:flutter/material.dart';

//Derived from: https://www.developerlibs.com/2019/08/flutter-draw-custom-shaps-clip-path.html
enum ClipPathType {
  NONE,
  ROUNDED_DOWN,
  ROUNDED_UP,
  TRIANGLE_DOWN,
  WAVE,
  JAGGED,
  CLOUDS,
  BOILER_PLATE,
  DIAGONAL,
  ROUNDED_CORNERS,
  ROUNDED_SHIELD
}

class SimpleClipPath extends CustomClipper<Path> {

  ClipPathType type;
  double radius;
  double topLeftPercentOfHeight;
  double bottomLeftPercentOfHeight;
  double topRightPercentOfHeight;
  double bottomRightPercentOfHeight;

  SimpleClipPath({
    this.type = ClipPathType.ROUNDED_DOWN,
    this.radius = 20.0,
    this.topLeftPercentOfHeight = 0.0,
    this.bottomLeftPercentOfHeight = 100.0,
    this.topRightPercentOfHeight = 0.0,
    this.bottomRightPercentOfHeight = 100.0
  });

  @override
  Path getClip(Size size) {
    switch(type) {
      case ClipPathType.ROUNDED_DOWN:
        return getRoundedDown(size);
      case ClipPathType.ROUNDED_SHIELD:
        return getRoundedShield(size);
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
      case ClipPathType.BOILER_PLATE:
        return getBoilerPlate(size);
      case ClipPathType.DIAGONAL:
        return getDiagonal(size);
      case ClipPathType.ROUNDED_CORNERS:
        return getRoundedCorners(size);
      default:
        return getNone(size);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  Path getNone(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    return path;
  }

  Path getRoundedShield(Size size) {
    var topLeftPixelsFromTop = (size.height * topLeftPercentOfHeight) / 100.0;
    var topRightPixelsFromTop = (size.height * topRightPercentOfHeight) / 100.0;

    //100% is default and indicates a default rounding is desired since otherwise it creates a rectangle (which seems broken)
    var botLeftPct = bottomLeftPercentOfHeight == 100 ? 60 : bottomLeftPercentOfHeight;
    var botRightPct = bottomRightPercentOfHeight == 100 ? 60 : bottomRightPercentOfHeight;
    var bottomLeftPixelsFromTop = (size.height * botLeftPct) / 100.0;
    var bottomRightPixelsFromTop = (size.height * botRightPct) / 100.0;

    Path path = Path();
    path.moveTo(0.0, bottomLeftPixelsFromTop);
    path.arcToPoint(Offset(size.width, bottomRightPixelsFromTop),
        radius: Radius.elliptical(size.width/2, size.height - bottomRightPixelsFromTop),
        clockwise: false
    );
    path.lineTo(size.width, topRightPixelsFromTop);
    path.lineTo(0.0, topLeftPixelsFromTop);
    path.close();
    return path;
  }

  Path getRoundedDown(Size size) {
    var topLeftPixelsFromTop = (size.height * topLeftPercentOfHeight) / 100.0;
    var topRightPixelsFromTop = (size.height * topRightPercentOfHeight) / 100.0;

    //100% is default and indicates a default rounding is desired since otherwise it creates a rectangle (which seems broken)
    var botLeftPct = bottomLeftPercentOfHeight == 100 ? 95 : bottomLeftPercentOfHeight;
    var botRightPct = bottomRightPercentOfHeight == 100 ? 95 : bottomRightPercentOfHeight;
    var bottomLeftPixelsFromTop = (size.height * botLeftPct) / 100.0;
    var bottomRightPixelsFromTop = (size.height * botRightPct) / 100.0;
    var delY = size.height - (bottomLeftPixelsFromTop + bottomRightPixelsFromTop) / 2.0;

    Path path = Path();
    path.moveTo(0.0, bottomLeftPixelsFromTop);
    path.quadraticBezierTo(
        size.width / 2, size.height + delY,
        size.width, bottomRightPixelsFromTop);
    path.lineTo(size.width, topRightPixelsFromTop);
    path.lineTo(0.0, topLeftPixelsFromTop);
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

  Path getDiagonal(Size size) {

    var topLeftPixelsFromTop = (size.height * topLeftPercentOfHeight) / 100.0;
    var bottomLeftPixelsFromTop = (size.height * bottomLeftPercentOfHeight) / 100.0;
    var topRightPixelsFromTop = (size.height * topRightPercentOfHeight) / 100.0;
    var bottomRightPixelsFromTop = (size.height * bottomRightPercentOfHeight) / 100.0;

    Path path = Path();
    path.moveTo(0, topLeftPixelsFromTop);
    path.lineTo(size.width, topRightPixelsFromTop);
    path.lineTo(size.width, bottomRightPixelsFromTop);
    path.lineTo(0, bottomLeftPixelsFromTop);

    return path;
  }

  Path getRoundedCorners(Size size) {

    var topLeftPixelsFromTop = (size.height * topLeftPercentOfHeight) / 100.0;
    var bottomLeftPixelsFromTop = (size.height * bottomLeftPercentOfHeight) / 100.0;
    var topRightPixelsFromTop = (size.height * topRightPercentOfHeight) / 100.0;
    var bottomRightPixelsFromTop = (size.height * bottomRightPercentOfHeight) / 100.0;

    var path = new Path();
    path.moveTo(0.0, topLeftPixelsFromTop + radius);
    path.lineTo(0.0, bottomLeftPixelsFromTop - radius);
    path.quadraticBezierTo(0.0, bottomLeftPixelsFromTop, radius, bottomLeftPixelsFromTop);
    path.lineTo(size.width - radius, bottomRightPixelsFromTop);
    path.quadraticBezierTo(size.width, bottomRightPixelsFromTop, size.width, bottomRightPixelsFromTop - radius);
    path.lineTo(size.width, topRightPixelsFromTop + radius);
    path.quadraticBezierTo(size.width, topRightPixelsFromTop, size.width - radius, topRightPixelsFromTop);
    path.lineTo(radius, topLeftPixelsFromTop);//was 20, 5
    path.quadraticBezierTo(0.0, topLeftPixelsFromTop, 0.0, topLeftPixelsFromTop + radius);
    return path;
  }
}
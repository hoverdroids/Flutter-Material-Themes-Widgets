import 'package:flutter/material.dart';
class ThemedBlob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const ThemedBlob({@required this.color, this.rotation = 0, this.scale = 1})
      : assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(240),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(180),
            ),
          ),
        ),
      ),
    );
  }
}
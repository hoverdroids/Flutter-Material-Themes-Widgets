import 'package:flutter/material.dart';

class TopRightScaleIn extends PageRouteBuilder {

  final Widget widget;

  TopRightScaleIn({required this.widget}) : super (
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
        return ScaleTransition(alignment: Alignment.topRight, scale: animation, child: child);
      },
      pageBuilder: ((BuildContext context, Animation<double> animation, Animation<double> secAnimation){
        return widget;
      })
  );
}
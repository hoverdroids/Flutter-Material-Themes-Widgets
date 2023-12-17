import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {

  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitChasingDots(
        color: context.watch<MaterialThemesManager>().colorPalette().secondary,
        size: 50.0,
      ),
    );
  }
}
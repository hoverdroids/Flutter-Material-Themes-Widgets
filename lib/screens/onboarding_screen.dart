import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends Container {

  final BackgroundGradientType backgroundGradientType;
  final ClipPathType clipPathType;
  final String title;
  final int titleFlex;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final EdgeInsets titlePadding;
  final TextAlign titleTextAlign;
  final String description;
  final int descriptionFlex;
  final ThemeGroupType descriptionType;
  final Emphasis descriptionEmphasis;
  final EdgeInsets descriptionPadding;
  final TextAlign descriptionTextAlign;
  final String imageUrl;
  SimpleClipPath imageClipPath;
  final BlendMode imageBlendMode;
  final Color imageBlendColor;
  final int imageFlex;
  final EdgeInsets imagePadding;
  final EdgeInsetsGeometry screenPadding;

  OnboardingScreen(
      {
        this.title,
        this.titleFlex = 1,
        this.titleType = ThemeGroupType.MOP,
        this.titleEmphasis = Emphasis.HIGH,
        this.titlePadding,
        this.titleTextAlign = TextAlign.center,
        this.description,
        this.descriptionFlex = 1,
        this.descriptionType = ThemeGroupType.MOP,
        this.descriptionEmphasis = Emphasis.NONE,
        this.descriptionPadding,
        this.descriptionTextAlign = TextAlign.center,
        this.imageUrl,
        this.backgroundGradientType = BackgroundGradientType.PRIMARY,
        this.clipPathType = ClipPathType.NONE,
        this.imageClipPath,
        this.imageBlendMode,
        this.imageBlendColor,
        this.imageFlex = 4,
        this.imagePadding,
        this.screenPadding = const EdgeInsets.all(20.0)
      }
  ) {
    imageClipPath = imageClipPath != null ? imageClipPath : SimpleClipPath(
        type: ClipPathType.ROUNDED_CORNERS
    );
  }

  @override
  Widget build(BuildContext context) {

    var children = <Widget>[];

    if (title != null) {
      children.add(_createTitle());
    }

    if (imageUrl != null) {
      children.add(_createImage(context, title != null, description != null));
    }

    if (description != null) {
      children.add(_createDescription());
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        child: ClipPath(
          child: Stack(
            children: <Widget>[
              context.watch<MaterialThemesManager>().getBackgroundGradient(backgroundGradientType),
              SafeArea(
                  child: Column(
                    children: children,
                  )
              )
            ],
          ),
          clipper: SimpleClipPath(type: clipPathType),
        ),
        padding: EdgeInsets.all(0.0),
      ),
    );
  }

  Widget _createTitle() {
    return Flexible(
      flex: titleFlex,
      child: Center(
          child: Padding(
            padding: titlePadding != null ? titlePadding : EdgeInsets.all(0.0),
            child: ThemedH4(title, type: titleType, emphasis: titleEmphasis, textAlign: titleTextAlign),
          )),
    );
  }

  Widget _createImage(BuildContext context, bool isTitlePresent, bool isDescriptionPresent) {
    var top = isTitlePresent ? 0.0 : 20.0;
    var bottom = isDescriptionPresent ? 0.0 : 20.0;
    var defPadding = EdgeInsets.fromLTRB(20.0, top, 20.0, bottom);

    return Flexible(
      flex: imageFlex,
      child: Center(
        child: Padding(
          padding: imagePadding != null ? imagePadding : defPadding,
          child: Container(
            decoration: context.watch<MaterialThemesManager>().getBoxDecorationShadow(),
            child: ClipPath(
              child: Image(
                image: AssetImage(imageUrl),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitHeight,
                colorBlendMode: imageBlendMode,
                color: imageBlendColor,
              ),
              clipper: imageClipPath,
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDescription() {
    return Flexible(
      flex: descriptionFlex,
      child: Center(
          child: Padding(
            padding: descriptionPadding != null ? descriptionPadding : EdgeInsets.all(20.0),
            child: ThemedH5(description, type: descriptionType, emphasis: descriptionEmphasis, textAlign: descriptionTextAlign),
          )),
    );
  }

}
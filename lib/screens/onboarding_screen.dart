import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/buttons_media.dart';
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
  final MainAxisAlignment titleMainAxisAlignment;
  final String description;
  final int descriptionFlex;
  final ThemeGroupType descriptionType;
  final Emphasis descriptionEmphasis;
  final EdgeInsets descriptionPadding;
  final TextAlign descriptionTextAlign;
  final MainAxisAlignment descriptionMainAxisAlignment;
  final String imageUrl;
  SimpleClipPath imageClipPath;
  final BlendMode imageBlendMode;
  final Color imageBlendColor;
  final int imageFlex;
  final EdgeInsets imagePadding;
  final MainAxisAlignment imageMainAxisAlignment;
  final BoxFit imageFit;
  final EdgeInsetsGeometry screenPadding;
  final String audioUrl;

  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _isAudioPlaying = false;
  bool _isAudioLoaded = false;

  OnboardingScreen(
      {
        this.title,
        this.titleFlex = 1,
        this.titleType = ThemeGroupType.MOP,
        this.titleEmphasis = Emphasis.HIGH,
        this.titlePadding,
        this.titleTextAlign = TextAlign.center,
        this.titleMainAxisAlignment = MainAxisAlignment.center,
        this.description,
        this.descriptionFlex = 1,
        this.descriptionType = ThemeGroupType.MOP,
        this.descriptionEmphasis = Emphasis.NONE,
        this.descriptionPadding,
        this.descriptionTextAlign = TextAlign.center,
        this.descriptionMainAxisAlignment = MainAxisAlignment.center,
        this.imageUrl,
        this.backgroundGradientType = BackgroundGradientType.PRIMARY,
        this.clipPathType = ClipPathType.NONE,
        this.imageClipPath,
        this.imageBlendMode,
        this.imageBlendColor,
        this.imageFlex = 4,
        this.imagePadding,
        this.imageMainAxisAlignment = MainAxisAlignment.center,
        this.imageFit  = BoxFit.fitHeight,
        this.screenPadding = const EdgeInsets.all(20.0),
        this.audioUrl
      }
  ) {
    imageClipPath = imageClipPath != null ? imageClipPath : SimpleClipPath(
        type: ClipPathType.ROUNDED_CORNERS
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (title != null) _createTitle(),
                      if (imageUrl != null) _createImage(context, title != null, description != null),
                      if (description != null) _createDescription()
                    ],
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
      child: Padding(
        padding: titlePadding != null ? titlePadding : EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: titleMainAxisAlignment,
          children: <Widget>[
            ThemedH4(title, type: titleType, emphasis: titleEmphasis, textAlign: titleTextAlign)
          ],
        )
      ),
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
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(imageUrl),
                    width: double.infinity,
                    height: double.infinity,
                    fit: imageFit,
                    colorBlendMode: imageBlendMode,
                    color: imageBlendColor,
                  ),
                  if (audioUrl != null) ...[
                    Center(
                        child: ThemedPlayButton(
                          pauseIcon: Icon(
                              Icons.pause,
                              color: context.watch<MaterialThemesManager>().colorPalette().primary,
                              size: 48),
                          playIcon: Icon(Icons.play_arrow,
                              color: context.watch<MaterialThemesManager>().colorPalette().primary,
                              size: 48),
                          onPressed: () {
                            if (!_isAudioLoaded) {
                              _isAudioPlaying = true;
                              _isAudioLoaded = true;
                              assetsAudioPlayer.open(Audio(audioUrl));
                              assetsAudioPlayer.play();
                            } else if (_isAudioPlaying) {
                              _isAudioPlaying = false;
                              assetsAudioPlayer.pause();
                            } else {
                              _isAudioPlaying = true;
                              assetsAudioPlayer.play();
                            }
                          },
                        )
                    )
                  ]
                ],
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
        child: Padding(
          padding: descriptionPadding != null ? descriptionPadding : EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: descriptionMainAxisAlignment,
              children: <Widget>[
                ThemedH5(description, type: descriptionType, emphasis: descriptionEmphasis, textAlign: descriptionTextAlign),
            ]
          )
        ),
      ),
    );
  }

}
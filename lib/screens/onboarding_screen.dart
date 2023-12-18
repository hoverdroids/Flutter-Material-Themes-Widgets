// ignore_for_file: constant_identifier_names

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/buttons_media.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {

  static const SimpleClipPath DEFAULT_IMAGE_CLIP_PATH = SimpleClipPath(
      type: ClipPathType.ROUNDED_CORNERS
  );

  final BackgroundGradientType backgroundGradientType;
  final ClipPathType clipPathType;
  final String? title;
  final int titleFlex;
  final ThemeGroupType titleType;
  final Emphasis titleEmphasis;
  final EdgeInsets? titlePadding;
  final TextAlign titleTextAlign;
  final MainAxisAlignment titleMainAxisAlignment;
  final String? description;
  final int descriptionFlex;
  final ThemeGroupType descriptionType;
  final Emphasis descriptionEmphasis;
  final EdgeInsets? descriptionPadding;
  final TextAlign descriptionTextAlign;
  final MainAxisAlignment descriptionMainAxisAlignment;
  final String? imageUrl;
  final SimpleClipPath? imageClipPath;
  final BlendMode? imageBlendMode;
  final Color? imageBlendColor;
  final int imageFlex;
  final EdgeInsets? imagePadding;
  final MainAxisAlignment imageMainAxisAlignment;
  final BoxFit imageFit;
  final EdgeInsetsGeometry screenPadding;
  final String? audioUrl;

  OnboardingScreen({
    super.key,
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
    this.imageClipPath = DEFAULT_IMAGE_CLIP_PATH,
    this.imageBlendMode,
    this.imageBlendColor,
    this.imageFlex = 4,
    this.imagePadding,
    this.imageMainAxisAlignment = MainAxisAlignment.center,
    this.imageFit = BoxFit.fitHeight,
    this.screenPadding = const EdgeInsets.all(20.0),
    this.audioUrl
  });

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {

  final _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isAudioPlaying = false;
  bool _isAudioLoaded = false;

  @override
  void initState() {
    _assetsAudioPlayer.playlistFinished.listen((finished) {
      if (finished) {
        setState(() {
          _isAudioPlaying = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ClipPath(
          clipper: SimpleClipPath(type: widget.clipPathType),
          child: Stack(
            children: <Widget>[
              context.watch<MaterialThemesManager>().getBackgroundGradient(widget.backgroundGradientType),
              SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (widget.title != null) _createTitle(),
                      if (widget.imageUrl != null) _createImage(context, widget.title != null, widget.description != null),
                      if (widget.description != null) _createDescription()
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Flexible(
      flex: widget.titleFlex,
      child: Padding(
        padding: widget.titlePadding ?? const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: widget.titleMainAxisAlignment,
          children: <Widget>[
            ThemedH4(widget.title, type: widget.titleType, emphasis: widget.titleEmphasis, textAlign: widget.titleTextAlign)
          ],
        )
      ),
    );
  }

  Widget _createImage(BuildContext context, bool isTitlePresent, bool isDescriptionPresent) {
    var top = isTitlePresent ? 0.0 : 20.0;
    var bottom = isDescriptionPresent ? 0.0 : 20.0;
    var defPadding = EdgeInsets.fromLTRB(20.0, top, 20.0, bottom);
    var imageUrl = widget.imageUrl;

    return Flexible(
      flex: widget.imageFlex,
      child: Center(
        child: Padding(
          padding: widget.imagePadding ?? defPadding,
          child: Container(
            decoration: context.watch<MaterialThemesManager>().getBoxDecorationShadow(),
            child: ClipPath(
              clipper: widget.imageClipPath,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  if (imageUrl != null)...[
                    Image(
                      image: AssetImage(imageUrl),
                      width: double.infinity,
                      height: double.infinity,
                      fit: widget.imageFit,
                      colorBlendMode: widget.imageBlendMode,
                      color: widget.imageBlendColor,
                    ),
                  ],
                  if (widget.audioUrl != null) ...[
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
                              setState(() {
                                _isAudioPlaying = true;
                                _isAudioLoaded = true;
                              });
                              var audioUrl = widget.audioUrl;
                              if (audioUrl != null) {
                                _assetsAudioPlayer.open(Audio(audioUrl));
                              }
                              _assetsAudioPlayer.play();
                            } else if (_isAudioPlaying) {
                              setState(() {
                                _isAudioPlaying = false;
                              });
                              _assetsAudioPlayer.pause();
                            } else {
                              setState(() {
                                _isAudioPlaying = true;
                              });
                              _assetsAudioPlayer.play();
                            }
                          },
                          isPlaying: _isAudioPlaying
                        )
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDescription() {
    return Flexible(
      flex: widget.descriptionFlex,
        child: Padding(
          padding: widget.descriptionPadding ?? const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: widget.descriptionMainAxisAlignment,
              children: <Widget>[
                ThemedH5(widget.description, type: widget.descriptionType, emphasis: widget.descriptionEmphasis, textAlign: widget.descriptionTextAlign),
            ]
          )
        ),
      ),
    );
  }

}
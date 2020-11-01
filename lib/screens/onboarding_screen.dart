import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/clippaths/clip_paths.dart';
import 'package:material_themes_widgets/fundamental/buttons_media.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {

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

  OnboardingScreen({
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
    this.imageFit = BoxFit.fitHeight,
    this.screenPadding = const EdgeInsets.all(20.0),
    this.audioUrl
  }) {
    imageClipPath = imageClipPath != null ? imageClipPath : SimpleClipPath(
      type: ClipPathType.ROUNDED_CORNERS
    );
  }


  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isAudioPlaying = false;
  bool _isAudioLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        child: ClipPath(
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
          clipper: SimpleClipPath(type: widget.clipPathType),
        ),
        padding: EdgeInsets.all(0.0),
      ),
    );
  }

  Widget _createTitle() {
    return Flexible(
      flex: widget.titleFlex,
      child: Padding(
        padding: widget.titlePadding != null ? widget.titlePadding : EdgeInsets.all(0.0),
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

    return Flexible(
      flex: widget.imageFlex,
      child: Center(
        child: Padding(
          padding: widget.imagePadding != null ? widget.imagePadding : defPadding,
          child: Container(
            decoration: context.watch<MaterialThemesManager>().getBoxDecorationShadow(),
            child: ClipPath(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.imageUrl),
                    width: double.infinity,
                    height: double.infinity,
                    fit: widget.imageFit,
                    colorBlendMode: widget.imageBlendMode,
                    color: widget.imageBlendColor,
                  ),
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
                              _assetsAudioPlayer.open(Audio(widget.audioUrl));
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
              clipper: widget.imageClipPath,
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
          padding: widget.descriptionPadding != null ? widget.descriptionPadding : EdgeInsets.all(20.0),
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
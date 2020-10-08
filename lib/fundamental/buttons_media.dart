import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_themes_widgets/fundamental/icons.dart';
import 'blob.dart';

//Inspired by: https://levelup.gitconnected.com/flutter-tutorial-music-button-animation-744616b14501
class ThemedPlayButton extends StatefulWidget {

  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  final VoidCallback onPressed;

  ThemedPlayButton({
    @required this.onPressed,
    this.initialIsPlaying = false,
    this.playIcon = const Icon(Icons.play_arrow),
    this.pauseIcon = const Icon(Icons.pause),
  });

  @override
  _ThemedPlayButtonState createState() => _ThemedPlayButtonState();
}

class _ThemedPlayButtonState extends State<ThemedPlayButton> with TickerProviderStateMixin {

  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  bool isPlaying = false;
  AnimationController _rotationController;
  AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;
  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialIsPlaying;
    _rotationController =
    AnimationController(vsync: this, duration: _kRotationDuration)
      ..addListener(() => setState(_updateRotation))
      ..repeat();

    _scaleController =
    AnimationController(vsync: this, duration: _kToggleDuration)
      ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying);

    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child:
      IconButton(
        icon: isPlaying ? widget.pauseIcon : widget.playIcon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 48, minHeight: 48),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (_showWaves) ...[
            ThemedBlob(color: Color(0xff0092ff), scale: _scale, rotation: _rotation),
            ThemedBlob(color: Color(0xff4ac7b7), scale: _scale, rotation: _rotation * 2 - 30),
            ThemedBlob(color: Color(0xffa4a6f6), scale: _scale, rotation: _rotation * 3 - 45),
          ],
          Container(
            constraints: BoxConstraints.expand(),
            child: AnimatedSwitcher(
              child: _buildIcon(isPlaying),
              duration: _kToggleDuration,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}
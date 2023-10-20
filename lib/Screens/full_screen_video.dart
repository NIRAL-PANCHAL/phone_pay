import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  VideoScreen({required this.videoUrl});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _showIcon = false;
  double _currentSliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          // Ensure the first frame is shown after the video is initialized
        });
        _playVideoInChunks();
      });
  }

  void _playVideoInChunks() async {
    // Play the video in chunks of 15 seconds
    while (_controller.value.position < _controller.value.duration) {
      await _controller.play();
      await Future.delayed(Duration(seconds: 15));
      setState(() {
        _currentSliderValue = _controller.value.position.inSeconds.toDouble();
      });
      await _controller.pause();
      // You can add more logic here if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLandscapeVideo(),
    );
  }

  Widget _buildLandscapeVideo() {
    return InteractiveViewer(
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.15, // Minimum scale allowed
      maxScale: 3.0, // Maximum scale allowed
      child: RotatedBox(
        quarterTurns: 1, // Rotate 90 degrees
        child: Stack(
          fit: StackFit.expand,
          children: [
            Stack(
              children: [
                VideoPlayer(_controller),
                Positioned(
                  bottom: 50,
                  right: 100,
                  child: _showIcon
                      ? Icon(
                          Icons.fast_forward_outlined,
                          color: Colors.white,
                          size: 50,
                        )
                      : Container(),
                ),
              ],
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleFullScreen,
                onDoubleTap: _handleDoubleTap, // Added double-tap gesture
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: // Wrap your Slider widget with SliderTheme
              SliderTheme(
                data: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                  trackHeight: 2.0, // Adjust the height of the track
                  thumbColor: Colors.redAccent,
                  activeTrackColor: Colors.red,
                  inactiveTrackColor: Colors.white,
                ),
                child: Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: _controller.value.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                  onChangeEnd: (value) {
                    _controller.seekTo(Duration(seconds: value.toInt()));
                    _controller.play();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFullScreen() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _skipForward() {
    Duration newPosition = _controller.value.position + Duration(seconds: 10);
    if (newPosition < _controller.value.duration) {
      _controller.seekTo(newPosition);
      setState(() {
        _currentSliderValue = newPosition.inSeconds.toDouble();
      });
    }
  }

  void _handleDoubleTap() {
    setState(() {
      _showIcon = true;
    });

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _showIcon = false;
      });
    });
    _skipForward();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

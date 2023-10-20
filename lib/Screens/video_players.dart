import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver {
  late List<String> videoAssets; // Add a list of video assets

  VideoPlayerController? _controller;
  bool isLandscapeMode = false; // Track the landscape mode state
  final floating = Floating();
  bool isFloated = false;

  void toggleLandscapeMode() {
    setState(() {
      isLandscapeMode = !isLandscapeMode;
      if (isLandscapeMode) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = VideoPlayerController.asset("assets/anikmal.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      });
  }

  // void changeVideo(int index) {
  //   _controller!.pause(); // Pause the previous video
  //   setState(() {
  //     _currentPage = index;
  //     _controller = VideoPlayerController.asset(videoAssets[index])
  //       ..initialize().then((_) {
  //         _controller!.play();
  //       });
  //   });
  // }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.inactive) {
      floating.enable(Rational.square());
    }
  }

  Future<void> enablePip() async {
    final status = await floating.enable(Rational.landscape());
    debugPrint('PiP enabled? $status');
  }

  void onPiPDisabled() {
    setState(() {
      isFloated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: isLandscapeMode == true
            ? null
            : isLandscapeMode == false && isFloated == true
                ? null
                : AppBar(
                    title: Text('Video Player'),
                    automaticallyImplyLeading: true),
        body: Stack(
          children: [
            GestureDetector(
              onDoubleTap: toggleLandscapeMode,
              child: Center(
                child: Container(
                  child: _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio ==
                                  1.7777777777777777
                              ? 4 / 3
                              : 2,
                          child: Stack(children: [
                            Container(
                                child: Container(
                                    child: VideoPlayer(_controller!))),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: isFloated == true
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            toggleLandscapeMode();
                                          });
                                        },
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Icon(
                                              isLandscapeMode
                                                  ? Icons.fullscreen_exit
                                                  : Icons.fullscreen,
                                              color: Colors.white,
                                            )),
                                      ))
                          ]))
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
              // onTap: () {
              //   if (_controller!.value.isPlaying) {
              //     _controller!.pause();
              //   } else {
              //     _controller!.play();
              //   }
              // },
            ),
            // Button to switch between landscape and portrait mode
          ],
        ),
        floatingActionButton: FutureBuilder<bool>(
          future: floating.isPipAvailable,
          initialData: false,
          builder: (context, snapshot) => snapshot.data!
              ? PiPSwitcher(
                  childWhenDisabled: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isFloated = true;
                        enablePip();
                      });
                    },
                    child: const Icon(Icons.picture_in_picture),
                  ),
                  childWhenEnabled: SizedBox.shrink())
              : const Card(
                  child: Text('Pip Unavailable'),
                ),
        ),
      ),
    );
  }
}

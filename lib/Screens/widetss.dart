import 'package:flutter/material.dart';
import 'package:phone_pay/models/getData_reponse_model.dart';
import 'package:video_player/video_player.dart';

class VideoList {
  String? videoUrl;
  VideoPlayerController? videoController;

  VideoList({this.videoUrl, this.videoController});
}

List<VideoList> initialVideoList = [];

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  Dataam? data;

  VideoPlayerWidget({required this.videoUrl, this.data});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = false;
  bool isLoading = true;
  String alreadyInitialVideoUrl = "";

  @override
  void initState() {
    super.initState();
    initialVideoList.forEach((e) {
      if (e.videoUrl.toString() == widget.data!.media![0].url.toString()) {
        alreadyInitialVideoUrl = e.videoUrl.toString();
      }
    });
    if (alreadyInitialVideoUrl.isEmpty) {
      _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          _videoPlayerController.setVolume(1.0);
          _videoPlayerController.setLooping(true);
          _videoPlayerController.play();
          setState(() {
            initialVideoList.add(VideoList(
                videoUrl: widget.data!.media![0].url.toString(),
                videoController: _videoPlayerController));
          });
        });
    } else {
      _videoPlayerController = initialVideoList
          .firstWhere((element) =>
              element.videoUrl == widget.data!.media![0].url.toString())
          .videoController!;
      _videoPlayerController.play();
    }
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minHeight: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _videoPlayerController.value.isInitialized
              ? _videoPlayerController.value.aspectRatio != 0.5625
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController))
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: VideoPlayer(_videoPlayerController),
                    )
              : Container(
                  child: Stack(
                    children: [
                      if (isLoading) // Show CircularProgressIndicator if isLoading is true
                        AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: Container(
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.red,
                              strokeWidth: 0.5,
                              backgroundColor: Colors.black,
                            )),
                          ),
                        ),
                    ],
                  ),
                ),

          /*if (!_isPlaying)
            Icon(
              Icons.play_arrow,
              size: 64.sp,
              color: Colorshite60,
            ),*/
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:funda_assessment/widgets/circular_button.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget(this.url, {Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.url,
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Center(
              child: CircularButton(isPlaying ? Icons.stop : Icons.play_arrow,
                  _toggleVideoPlayback),
            ),

            // I have disabled video playback since I didn't have
            // enough time to implement and test it

            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     VideoPlayer(_controller),
            //   ],
            // ),
          )
        : Container();
  }

  void _toggleVideoPlayback() {
    setState(() {
      // if (isPlaying) {
      //   _controller.play();
      // } else {
      //   _controller.pause();
      // }
      isPlaying = !isPlaying;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:funda_assessment/models/video.dart';
import 'package:funda_assessment/widgets/video_player_widget.dart';

class PropertyVideoSlider extends StatefulWidget {
  final List<Video> videos;
  const PropertyVideoSlider(this.videos, {Key? key}) : super(key: key);

  @override
  _PropertyVideoSliderState createState() => _PropertyVideoSliderState();
}

class _PropertyVideoSliderState extends State<PropertyVideoSlider> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final source = widget.videos[index];

          if (source.getFirstSource() != null) {
            return VideoPlayerWidget(source.getFirstSource()!.url);
          }

          return Container();
        },
        itemCount: widget.videos.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

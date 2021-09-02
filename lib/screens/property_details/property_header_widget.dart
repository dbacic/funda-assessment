import 'package:flutter/material.dart';
import 'package:funda_assessment/models/property_details.dart';
import 'package:funda_assessment/widgets/circular_button.dart';

import 'property_image_slider.dart';
import 'property_video_slider.dart';

class PropertyHeaderWidget extends StatefulWidget {
  final PropertyDetails propertyDetails;

  const PropertyHeaderWidget(this.propertyDetails, {Key? key})
      : super(key: key);

  @override
  _PropertyHeaderWidgetState createState() => _PropertyHeaderWidgetState();
}

class _PropertyHeaderWidgetState extends State<PropertyHeaderWidget> {
  bool _isVideoListShown = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isVideoListShown
            ? PropertyVideoSlider(widget.propertyDetails.videos)
            : PropertyImageSlider(widget.propertyDetails.images),
        Positioned(
          top: 12,
          left: 12,
          child: CircularButton(
            Icons.close,
            _closeScreen,
          ),
        ),
        Visibility(
          visible: widget.propertyDetails.videos.isNotEmpty,
          child: Positioned(
            top: 12,
            right: 12,
            child: CircularButton(
                _isVideoListShown ? Icons.image : Icons.video_collection,
                _toggleVideoImageList),
          ),
        ),
      ],
    );
  }

  void _toggleVideoImageList() {
    setState(() {
      _isVideoListShown = !_isVideoListShown;
    });
  }

  void _closeScreen() {
    Navigator.pop(context);
  }
}

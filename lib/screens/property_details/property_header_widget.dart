import 'package:flutter/material.dart';
import 'package:funda_assessment/models/property_details.dart';

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
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white70,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isVideoListShown = !_isVideoListShown;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white70,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  _isVideoListShown ? Icons.image : Icons.video_collection,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

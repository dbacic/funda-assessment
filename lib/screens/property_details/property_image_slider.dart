import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PropertyImageSlider extends StatelessWidget {
  final List<String> images;
  const PropertyImageSlider(this.images, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: images[index],
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          );
        },
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

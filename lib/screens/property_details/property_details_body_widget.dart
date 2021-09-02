import 'package:flutter/material.dart';
import 'package:funda_assessment/models/property_details.dart';
import 'package:url_launcher/url_launcher.dart';

import 'property_header_widget.dart';

class PropertyDetailsBodyWidget extends StatefulWidget {
  final PropertyDetails propertyDetails;

  const PropertyDetailsBodyWidget(this.propertyDetails, {Key? key})
      : super(key: key);

  @override
  _PropertyDetailsBodyWidgetState createState() =>
      _PropertyDetailsBodyWidgetState();
}

class _PropertyDetailsBodyWidgetState extends State<PropertyDetailsBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PropertyHeaderWidget(widget.propertyDetails),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.propertyDetails.address,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.propertyDetails.location,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.propertyDetails.formatCurrency(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Constructed: ${widget.propertyDetails.constructionYear}'),
                SizedBox(
                  height: 32,
                ),
                Text(widget.propertyDetails.fullDescription),
                SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () =>
                        _openFullWebSite(widget.propertyDetails.url),
                    child: Text("See full description"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openFullWebSite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

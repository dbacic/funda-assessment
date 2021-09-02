import 'package:flutter/material.dart';
import 'package:funda_assessment/bloc/property_details_bloc.dart';
import 'package:funda_assessment/screens/property_details/property_header_widget.dart';
import 'package:funda_assessment/services/dependency_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final String propertyId;

  const PropertyDetailsScreen(this.propertyId, {Key? key}) : super(key: key);

  @override
  _PropertyDetailsScreenState createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  late PropertyDetailsContract _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt.get();
    _bloc.loadDPropertyDetails(widget.propertyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          initialData: PropertyDetailsLoading,
          builder: (context, snapshot) {
            switch (snapshot.data.runtimeType) {
              case PropertyDetailsLoading:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case PropertyDetailsData:
                final data = snapshot.data as PropertyDetailsData;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      PropertyHeaderWidget(data.propertyDetails),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.propertyDetails.address,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.propertyDetails.location,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              data.propertyDetails.formatCurrency(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                                'Constructed: ${data.propertyDetails.constructionYear}'),
                            SizedBox(
                              height: 32,
                            ),
                            Text(data.propertyDetails.fullDescription),
                            SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () =>
                                    _openFullWebSite(data.propertyDetails.url),
                                child: Text("See full description"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

              case PropertyDetailsError:
                final error = snapshot.data as PropertyDetailsError;
                return Center(
                  child: Text(
                      error.error ?? 'Something went wrong, please try again.'),
                );
            }

            // showing loader while the stram builder starts up
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: _bloc.propertyDetailsStream(),
        ),
      ),
    );
  }
}

void _openFullWebSite(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

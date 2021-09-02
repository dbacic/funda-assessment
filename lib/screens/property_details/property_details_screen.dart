import 'package:flutter/material.dart';
import 'package:funda_assessment/bloc/property_details_bloc.dart';
import 'package:funda_assessment/services/dependency_provider.dart';
import 'package:funda_assessment/widgets/custom_error_widget.dart';
import 'package:funda_assessment/widgets/loading_widget.dart';

import 'property_details_body_widget.dart';

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
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          initialData: PropertyDetailsLoading(),
          builder: (context, snapshot) {
            switch (snapshot.data.runtimeType) {
              case PropertyDetailsLoading:
                return const LoadingWidget();

              case PropertyDetailsData:
                final data = snapshot.data as PropertyDetailsData;
                return PropertyDetailsBodyWidget(data.propertyDetails);

              case PropertyDetailsError:
                final error = snapshot.data as PropertyDetailsError;
                return CustomErrorWidget(
                  error.error ?? 'Something went wrong, please try again.',
                  onRetryClicked: _loadData,
                );
            }

            // showing loader while the stram builder starts up
            return const LoadingWidget();
          },
          stream: _bloc.propertyDetailsStream(),
        ),
      ),
    );
  }

  void _loadData() {
    _bloc.loadDPropertyDetails(widget.propertyId);
  }
}

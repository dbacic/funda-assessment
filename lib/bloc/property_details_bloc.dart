import 'dart:async';

import 'package:funda_assessment/models/property_details.dart';
import 'package:funda_assessment/repositories/property_repository.dart';

import 'base_bloc.dart';

class PropertyDetailsBloc extends BaseBloc implements PropertyDetailsContract {
  final _controller = StreamController<PropertyDetailsStates>.broadcast();

  final PropertyRepoContract _propertyRepoContract;

  PropertyDetailsBloc(this._propertyRepoContract);

  @override
  void dispose() {
    _controller.close();
  }

  @override
  void loadDPropertyDetails(String id) {
    _controller.sink.add(PropertyDetailsLoading());
    _propertyRepoContract.fetchPropertyInfo(id).then((response) {
      if (response.isSuccess()) {
        _controller.sink
            .add(PropertyDetailsData(propertyDetails: response.success!));
      } else {
        _controller.sink
            .add(PropertyDetailsError(error: response.error?.toString()));
      }
    });
  }

  @override
  Stream<PropertyDetailsStates> propertyDetailsStream() {
    return _controller.stream.asBroadcastStream();
  }
}

// contract between the screen and bloc
abstract class PropertyDetailsContract {
  Stream<PropertyDetailsStates> propertyDetailsStream();
  void loadDPropertyDetails(String id);
}

// screen states
abstract class PropertyDetailsStates {}

class PropertyDetailsLoading extends PropertyDetailsStates {}

class PropertyDetailsData extends PropertyDetailsStates {
  final PropertyDetails propertyDetails;
  PropertyDetailsData({
    required this.propertyDetails,
  });
}

class PropertyDetailsError extends PropertyDetailsStates {
  final String? error;
  PropertyDetailsError({
    required this.error,
  });
}

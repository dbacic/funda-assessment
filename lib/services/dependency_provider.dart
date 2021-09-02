import 'package:funda_assessment/bloc/property_details_bloc.dart';
import 'package:funda_assessment/repositories/property_repository.dart';
import 'package:get_it/get_it.dart';

import 'http_client.dart';

final getIt = GetIt.instance;

void setUpDependencyInjection() {
  // register utils
  getIt.registerSingleton(HttpClient());

  // register all repositories
  getIt.registerLazySingleton<PropertyRepoContract>(
      () => PropertyRepository(getIt.get()));

  // register all blocs
  getIt.registerLazySingleton<PropertyDetailsContract>(
      () => PropertyDetailsBloc(getIt.get()));
}

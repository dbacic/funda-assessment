import 'package:funda_assessment/models/funda_response.dart';
import 'package:funda_assessment/models/property_details.dart';
import 'package:funda_assessment/services/environment_variables.dart';
import 'package:funda_assessment/services/http_client.dart';

class PropertyRepository extends PropertyRepoContract {
  final String fetchPropertyDetailsEndpoint =
      'feeds/Aanbod.svc/json/detail/{key}/koop/{propertyId}/';
  final HttpClient _httpClient;

  // simple cache mechasnizm, can be extended to validate expiration of cache
  // and to also store and read from database
  final _cache = <String, PropertyDetails>{};

  PropertyRepository(this._httpClient);

  Future<FundaResponse<PropertyDetails>> fetchPropertyInfo(String byId) async {
    // check first cache if it is already loaded, if yes return it if no fetch it
    if (_cache.containsKey(byId)) {
      return FundaResponse.success(_cache[byId]);
    }

    final endpoint = fetchPropertyDetailsEndpoint
        .replaceFirst('{key}', apiKey)
        .replaceFirst('{propertyId}', byId);
    return _httpClient.doGet(endpoint).then((response) {
      try {
        print(response.body);
        final propertyDetails = PropertyDetails.fromJson(response.body);
        return FundaResponse<PropertyDetails>.success(propertyDetails);
      } on Exception catch (error) {
        // we can log exceptions to Firebase Crashlytics or any other platform
        // in this case the crass can be either failed parsing or missing data
        return FundaResponse<PropertyDetails>.error(error.toString());
      }
    }).catchError(
        (error) => FundaResponse<PropertyDetails>.error(error.toString()));
  }
}

abstract class PropertyRepoContract {
  Future<FundaResponse<PropertyDetails>> fetchPropertyInfo(String byId);
}

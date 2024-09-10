import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:points_of_interests/core/network/dio_http_client.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

List<Provider> createProviders() {
  return [
    Provider<DioHttpClient>(
      create: (context) => DioHttpClient(),
    ),
    Provider<Realm>(
      create: (context) {
        final config = Configuration.local([PointOfInterestRealm.schema]);
        return Realm(config);
      },
    ),
  ];
}

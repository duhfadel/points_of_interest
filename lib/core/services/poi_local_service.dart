import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:points_of_interests/core/models/point_of_interest_ui.dart';
import 'package:realm/realm.dart';

class PointsOfInterestLocalService {
  final Realm realm;

  PointsOfInterestLocalService(this.realm);

  Future<void> savePointsOfInterest(List<PointOfInterest> pointsOfInterest) async {
    realm.write(() {
      for (var poi in pointsOfInterest) {
        final realmPOI = poi.toRealm();
        realm.add(realmPOI, update: true);
      }
    });
  }

  List<PointOfInterest> getPointsOfInterest() {
    List<PointOfInterestRealm> realmPoints = realm.all<PointOfInterestRealm>().toList();
    return realmPoints.map((realmPOI) => PointOfInterest.fromRealm(realmPOI)).toList();
  }

  void deleteAllPointsOfInterest() {
    realm.write(() => realm.deleteAll<PointOfInterestRealm>());
  }
}

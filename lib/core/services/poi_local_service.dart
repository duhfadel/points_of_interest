import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:realm/realm.dart';

abstract class PointsOfInterestLocalService {
  Future<void> savePointsOfInterest(List<PointOfInterest> pointsOfInterest);
  List<PointOfInterest> getPointsOfInterest();
  void deleteAllPointsOfInterest();
}

class PointsOfInterestLocalServiceImpl extends PointsOfInterestLocalService {
  final Realm realm;

  PointsOfInterestLocalServiceImpl(this.realm);

  @override
  Future<void> savePointsOfInterest(List<PointOfInterest> pointsOfInterest) async {
    realm.write(() {
      for (var poi in pointsOfInterest) {
        final realmPOI = poi.toRealm();
        realm.add(realmPOI, update: true);
      }
    });
  }

  @override
  List<PointOfInterest> getPointsOfInterest() {
    List<PointOfInterestRealm> realmPoints = realm.all<PointOfInterestRealm>().toList();
    return realmPoints.map((realmPOI) => PointOfInterest.fromRealm(realmPOI)).toList();
  }

  @override
  void deleteAllPointsOfInterest() {
    realm.write(() => realm.deleteAll<PointOfInterestRealm>());
  }
}

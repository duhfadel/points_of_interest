import 'package:points_of_interests/core/models/point_of_interest_ui.dart';
import 'package:points_of_interests/core/services/poi_local_service.dart';
import 'package:points_of_interests/core/services/poi_service.dart';

abstract class PointsOfInterestRepository {
  Future<List<PointOfInterest>> fetchPointsOfInterests();
  void deleteAllPointsOfInterest();
}

class PointsOfInterestRepositoryImpl extends PointsOfInterestRepository {
  final PointsOfInterestesServices pointsOfInterestesServices;
  final PointsOfInterestLocalService pointsOfInterestLocalService;

  PointsOfInterestRepositoryImpl({
    required this.pointsOfInterestesServices,
    required this.pointsOfInterestLocalService,
  });

  @override
  Future<List<PointOfInterest>> fetchPointsOfInterests() async {
    //First we fetch in local, if there is data saved
    List<PointOfInterest> localPoints = pointsOfInterestLocalService.getPointsOfInterest();
    if (localPoints.isNotEmpty) {
      return localPoints;
    } else {
      //If there is no local data, we call the API
      List<PointOfInterest> apiPoints = await pointsOfInterestesServices.fetchPointsOfInterests();
      await pointsOfInterestLocalService.savePointsOfInterest(apiPoints);
      return apiPoints;
    }
  }

  @override
  void deleteAllPointsOfInterest() {
    pointsOfInterestLocalService.deleteAllPointsOfInterest();
  }
}

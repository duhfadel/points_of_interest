import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:points_of_interests/core/constants.dart';
import 'package:points_of_interests/core/models/point_of_interest_ui.dart';

abstract class PointsOfInterestesServices {
  Future<List<PointOfInterest>> fetchPointsOfInterests();
}

class PointsOfInterestesServicesImpl extends PointsOfInterestesServices {
  final Dio dio;

  PointsOfInterestesServicesImpl({required this.dio});

  @override
  Future<List<PointOfInterest>> fetchPointsOfInterests() async {
    try {
      //This is the correct API request:
      Response response = await dio.get(AppConstants.pathUrl);
      //Use this line to receive an error:
      // Response response = await dio.get('worldline-spain/technical_test_backend/main/poisasdsa.json');
      Map<String, dynamic> decodedData = jsonDecode(response.data);
      List<dynamic> dynamicList = decodedData['list'];
      List<PointOfInterest> pointsOfInterest = dynamicList.map((item) => PointOfInterest.fromMap(item)).toList();
      return pointsOfInterest;
    } catch (e) {
      throw Exception(
          'There was an error fetching the points of interest, please get in touch with this developer, he probably changed the URL!');
    }
  }
}

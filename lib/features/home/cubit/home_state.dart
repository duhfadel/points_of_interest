// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:points_of_interests/core/models/point_of_interest.dart';

class HomeState {
  final List<PointOfInterest>? pointsOfInterests;
  final String errorMessage;

  HomeState(this.pointsOfInterests, this.errorMessage);

  HomeState copyWith({
    List<PointOfInterest>? pointsOfInterests,
    String? errorMessage
  }) {
    return HomeState(
      pointsOfInterests ?? this.pointsOfInterests,
      errorMessage?? this.errorMessage
    );
  }
}

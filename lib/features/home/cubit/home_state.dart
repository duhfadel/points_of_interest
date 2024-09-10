// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:points_of_interests/core/models/point_of_interest_ui.dart';

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

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.pointsOfInterests, pointsOfInterests) &&
      other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => pointsOfInterests.hashCode ^ errorMessage.hashCode;
}

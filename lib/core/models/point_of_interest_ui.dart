import 'dart:convert';
import 'package:points_of_interests/core/models/point_of_interest.dart';

//This is the objected the API and the UI will use
class PointOfInterest {
  final String id;
  final String title;
  final String geocoordinates;
  final String image;

  PointOfInterest({required this.id, required this.title, required this.geocoordinates, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'geocoordinates': geocoordinates,
      'image': image,
    };
  }

  factory PointOfInterest.fromMap(Map<String, dynamic> map) {
    return PointOfInterest(
      id: map['id'] as String,
      title: map['title'] as String,
      geocoordinates: map['geocoordinates'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PointOfInterest.fromJson(String source) =>
      PointOfInterest.fromMap(json.decode(source) as Map<String, dynamic>);

  //Here we transform from a Realm object (using factory, Javier, as your question today! xD)
  factory PointOfInterest.fromRealm(PointOfInterestRealm pointOfInterestRealm) {
    return PointOfInterest(
        id: pointOfInterestRealm.id,
        title: pointOfInterestRealm.title,
        geocoordinates: pointOfInterestRealm.geocoordinates,
        image: pointOfInterestRealm.image);
  }

  //And heere we transform to a Realm object
  PointOfInterestRealm toRealm() {
    return PointOfInterestRealm(id, title, geocoordinates, image);
  }
}

import 'dart:convert';
import 'package:realm/realm.dart';
part 'point_of_interest.realm.dart';

//We are using Realm to save the data, we could use SharedPreferences, but I've searched for a
//good library and this is really good!
@RealmModel()
class _PointOfInterestRealm {
  late String id;
  late String title;
  late String geocoordinates;
  late String image;
}

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

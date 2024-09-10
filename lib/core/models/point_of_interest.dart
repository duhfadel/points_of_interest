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
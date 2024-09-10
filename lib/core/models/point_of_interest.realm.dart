// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_of_interest.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PointOfInterestRealm extends _PointOfInterestRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  PointOfInterestRealm(
    String id,
    String title,
    String geocoordinates,
    String image,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'geocoordinates', geocoordinates);
    RealmObjectBase.set(this, 'image', image);
  }

  PointOfInterestRealm._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get geocoordinates =>
      RealmObjectBase.get<String>(this, 'geocoordinates') as String;
  @override
  set geocoordinates(String value) =>
      RealmObjectBase.set(this, 'geocoordinates', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<PointOfInterestRealm>> get changes =>
      RealmObjectBase.getChanges<PointOfInterestRealm>(this);

  @override
  Stream<RealmObjectChanges<PointOfInterestRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PointOfInterestRealm>(this, keyPaths);

  @override
  PointOfInterestRealm freeze() =>
      RealmObjectBase.freezeObject<PointOfInterestRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'geocoordinates': geocoordinates.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(PointOfInterestRealm value) => value.toEJson();
  static PointOfInterestRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'geocoordinates': EJsonValue geocoordinates,
        'image': EJsonValue image,
      } =>
        PointOfInterestRealm(
          fromEJson(id),
          fromEJson(title),
          fromEJson(geocoordinates),
          fromEJson(image),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PointOfInterestRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, PointOfInterestRealm, 'PointOfInterestRealm', [
      SchemaProperty('id', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('geocoordinates', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:points_of_interests/core/repository/poi_repository.dart';
import 'package:points_of_interests/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PointsOfInterestRepository pointsOfInterestRepository;
  HomeCubit({required this.pointsOfInterestRepository}) : super(HomeState([], '')) {
    fetchPointsOfInterests();
  }

  //this list always have the full info - we filter data here to emit.
  List<PointOfInterest> fullList = [];

  Future<void> fetchPointsOfInterests() async {
    try {
      List<PointOfInterest> poiList = await pointsOfInterestRepository.fetchPointsOfInterests();
      emit(state.copyWith(pointsOfInterests: poiList, errorMessage: ''));
      fullList = poiList;
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  //filtering our list
  void filterList(String value) {
    List<PointOfInterest> filteredList = fullList.where((point) {
      return point.title.toLowerCase().contains(value.toLowerCase());
    }).toList();
    emit(state.copyWith(pointsOfInterests: filteredList));
  }

  //delete all info in cache
  void deleteAll() {
    pointsOfInterestRepository.deleteAllPointsOfInterest();
    emit(state.copyWith(pointsOfInterests: []));
    fullList = [];
  }
}

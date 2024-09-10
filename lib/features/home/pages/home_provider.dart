import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:points_of_interests/core/network/dio_http_client.dart';
import 'package:points_of_interests/core/repository/poi_repository.dart';
import 'package:points_of_interests/core/services/poi_local_service.dart';
import 'package:points_of_interests/core/services/poi_service.dart';
import 'package:points_of_interests/features/home/cubit/home_cubit.dart';
import 'package:points_of_interests/features/home/pages/home_page.dart';
import 'package:realm/realm.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    DioHttpClient dioHttpClient = DioHttpClient();
    final config = Configuration.local([PointOfInterestRealm.schema]);
    final realm = Realm(config);
    PointsOfInterestesServices pointsOfInterestesServices = PointsOfInterestesServicesImpl(dio: dioHttpClient.dio);
    PointsOfInterestLocalService pointsOfInterestLocalService = PointsOfInterestLocalService(realm);
    PointsOfInterestRepository pointsOfInterestRepository = PointsOfInterestRepositoryImpl(
        pointsOfInterestesServices: pointsOfInterestesServices,
        pointsOfInterestLocalService: pointsOfInterestLocalService);

    return BlocProvider(
      create: (context) => HomeCubit(pointsOfInterestRepository: pointsOfInterestRepository),
      child: const HomaPageScreen(),
    );
  }
}

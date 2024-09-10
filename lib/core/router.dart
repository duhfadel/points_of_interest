import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:points_of_interests/core/models/point_of_interest_ui.dart';
import 'package:points_of_interests/features/details/details_page.dart';
import 'package:points_of_interests/features/home/pages/home_provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeProvider();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {

            final pointOfInterest = state.extra as PointOfInterest;
            return DetailsScreen(pointOfInterest: pointOfInterest);          },
        ),
      ],
    ),
  ],
);

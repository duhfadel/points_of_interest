import 'package:flutter/material.dart';
import 'package:points_of_interests/core/models/point_of_interest.dart';
import 'package:points_of_interests/features/home/cubit/home_cubit.dart';
import 'package:points_of_interests/features/home/cubit/home_state.dart';
import 'package:points_of_interests/features/home/widgets/poi_button.dart';
import 'package:points_of_interests/features/home/widgets/poi_item.dart';

class PointsOfInterestColumn extends StatelessWidget {
  const PointsOfInterestColumn({super.key, required this.searchController, required this.homeCubit, required this.state});

  final TextEditingController searchController;
  final HomeCubit homeCubit;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchController,
          onChanged: (value) => homeCubit.filterList(value),
          decoration: const InputDecoration(hintText: 'Filter typing here'),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: state.pointsOfInterests?.length ?? 0,
          itemBuilder: (context, index) {
            PointOfInterest? pointOfInterest = state.pointsOfInterests?[index];
            if (pointOfInterest != null) {
              return PointOfInterestItem(pointOfInterest: pointOfInterest);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        PoiButton(homeCubit: homeCubit),
        const SizedBox(height: 24)
      ],
    );
  }
}


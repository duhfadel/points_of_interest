import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:points_of_interests/core/constants.dart';
import 'package:points_of_interests/core/models/point_of_interest_ui.dart';

class PointOfInterestItem extends StatelessWidget {
  const PointOfInterestItem({
    super.key,
    required this.pointOfInterest,
  });

  final PointOfInterest pointOfInterest;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.poiCardHeight,
      child: GestureDetector(
        onTap: () {
          context.go('/details', extra: pointOfInterest);
        },
        child: Card(
            child: Column(
          children: [
            const SizedBox(height: AppConstants.mediumSizeSpace),
            Text(
              textAlign: TextAlign.center,
              pointOfInterest.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.smallSizeSpace),
            Image.network(height: AppConstants.poiImageHeight, pointOfInterest.image)
          ],
        )),
      ),
    );
  }
}

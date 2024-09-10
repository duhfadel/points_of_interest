import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      height: 100,
      child: GestureDetector(
        onTap: () {
          context.go('/details', extra: pointOfInterest);
        },
        child: Card(
            child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              textAlign: TextAlign.center,
              pointOfInterest.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.network(height: 100, pointOfInterest.image)
          ],
        )),
      ),
    );
  }
}
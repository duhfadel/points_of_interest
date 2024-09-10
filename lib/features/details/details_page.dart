import 'package:flutter/material.dart';
import 'package:points_of_interests/core/models/point_of_interest_ui.dart';

class DetailsScreen extends StatelessWidget {
  final PointOfInterest pointOfInterest;

  const DetailsScreen({super.key, required this.pointOfInterest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pointOfInterest.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.network(
                pointOfInterest.image,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
              const SizedBox(height: 20),
              Text('Geocoordinates: ${pointOfInterest.geocoordinates}'),
            ],
          ),
        ),
      ),
    );
  }
}

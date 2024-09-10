import 'package:flutter/material.dart';
import 'package:points_of_interests/core/constants.dart';
import 'package:points_of_interests/features/home/cubit/home_cubit.dart';

class ButtonDeleteAllPoi extends StatelessWidget {
  const ButtonDeleteAllPoi({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppConstants.poiButtonHeight,
        width: double.maxFinite,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.redColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () => homeCubit.deleteAll(),
            child: const Text(
              'Delete data',
              style: TextStyle(color: AppConstants.whiteColor),
            )));
  }
}

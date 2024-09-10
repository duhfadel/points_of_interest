import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:points_of_interests/features/home/cubit/home_cubit.dart';
import 'package:points_of_interests/features/home/cubit/home_state.dart';
import 'package:points_of_interests/features/home/widgets/poi_column.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Stateful because we need the textEditingController
class HomaPageScreen extends StatefulWidget {
  const HomaPageScreen({super.key});

  @override
  State<HomaPageScreen> createState() => _HomaPageScreenState();
}

class _HomaPageScreenState extends State<HomaPageScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.homeAppBarTitle),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RefreshIndicator(
              onRefresh: () => homeCubit.fetchPointsOfInterests(),
              child: ListView(
                children: [
                  if (state.pointsOfInterests != null && state.pointsOfInterests!.isNotEmpty)
                    PointsOfInterestColumn(
                      searchController: searchController,
                      homeCubit: homeCubit,
                      state: state,
                    )
                  else
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text('${AppLocalizations.of(context)!.noPoiToShowText} \n${state.errorMessage}'),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

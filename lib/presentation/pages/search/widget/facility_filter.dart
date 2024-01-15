import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/presentation/pages/search/cubit/filter/filter_cubit.dart';
import 'package:sport_app/presentation/pages/search/widget/grid_facility_builder.dart';

class FacilityFilter extends StatelessWidget {
  final FilterCubit filterCubit;

  const FacilityFilter({super.key, required this.filterCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: filterCubit,
      child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Filters',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surfaceTint,
                        ),
                  ),
                ),
                GridFacilityBuilder(
                  itemCount: filterCubit.sportTypeList.length,
                  label: "SportType",
                  filterData: filterCubit.sportTypeList,
                  onSelectionChanged: context.read<FilterCubit>().selectSportTypeFilterIndex,
                  selectedType: state.selectedSportType,
                ),
                GridFacilityBuilder(
                  itemCount: filterCubit.coveringTypeList.length,
                  label: "CoveringType",
                  filterData: filterCubit.coveringTypeList,
                  onSelectionChanged: context.read<FilterCubit>().selectCoveringTypeFilterIndex,
                  selectedType: state.selectedCoveringType,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: context.read<FilterCubit>().resetFilters,
                      child: Text(
                        'Reset',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.pop(context.read<FilterCubit>().onSubmit),
                      child: Text(
                        'Submit',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

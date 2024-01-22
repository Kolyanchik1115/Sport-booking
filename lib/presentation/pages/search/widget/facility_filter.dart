import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/presentation/pages/search/cubit/filter/filter_cubit.dart';
import 'package:sport_app/presentation/pages/search/widget/grid_facility_builder.dart';
import 'package:sport_app/presentation/widgets/app_text_button.dart';

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
                          color: Theme.of(context).colorScheme.onBackground,
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
                    AppTextButton(onPressed: context.read<FilterCubit>().resetFilters, text: 'Reset'),
                    AppTextButton(onPressed: () => context.pop(context.read<FilterCubit>().onSubmit), text: 'Submit'),
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

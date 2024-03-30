import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/app_text_button.dart';
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    'Filters',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridFacilityBuilder(
                        itemCount: filterCubit.facilityTypeList.length,
                        label: "FacilityType",
                        filterData: filterCubit.facilityTypeList,
                        onSelectionChanged: context.read<FilterCubit>().selectFacilityTypeFilterIndex,
                        selectedType: state.selectedFacilityType,
                        icons: const [AppSvg.opened, AppSvg.closed],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridFacilityBuilder(
                        itemCount: filterCubit.sportTypeList.length,
                        label: "SportType",
                        filterData: filterCubit.sportTypeList,
                        onSelectionChanged: context.read<FilterCubit>().selectSportTypeFilterIndex,
                        selectedType: state.selectedSportType,
                        icons: const [AppSvg.soccer, AppSvg.basketball, AppSvg.volleyball, AppSvg.tennis],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridFacilityBuilder(
                        itemCount: filterCubit.coveringTypeList.length,
                        label: "CoveringType",
                        filterData: filterCubit.coveringTypeList,
                        onSelectionChanged: context.read<FilterCubit>().selectCoveringTypeFilterIndex,
                        selectedType: state.selectedCoveringType,
                        icons: const [
                          AppSvg.rubber,
                          AppSvg.sand,
                          AppSvg.artificialLawn,
                          AppSvg.naturalLawn,
                          AppSvg.parquet
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.background,
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppTextButton(onPressed: context.read<FilterCubit>().resetFilters, text: 'Reset'),
                    AppTextButton(onPressed: () => context.pop(context.read<FilterCubit>().onSubmit), text: 'Submit'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

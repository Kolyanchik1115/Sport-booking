import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/themes/grid_facility_builder.dart';

class FacilityFilter extends StatelessWidget {
  const FacilityFilter({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sportType = ['soccer', 'basketball'];
    List<String> coveringType = ['rubber', 'covering1', 'covering2', 'covering3'];
    String? selectedSportType, selectedCoveringType;

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
            itemCount: sportType.length,
            label: "SportType",
            filterData: sportType,
            onSelectionChanged: (selectedFilters) {
              selectedSportType = selectedFilters;
            },
          ),
          GridFacilityBuilder(
            itemCount: coveringType.length,
            label: "CoveringType",
            filterData: coveringType,
            onSelectionChanged: (selectedFilters) {
              selectedCoveringType = selectedFilters;
            },
          ),
          TextButton(
            onPressed: () => context.pop([selectedSportType, selectedCoveringType]),
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

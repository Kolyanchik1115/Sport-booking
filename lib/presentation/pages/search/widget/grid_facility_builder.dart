import 'package:flutter/material.dart';
import 'package:sport_app/presentation/pages/search/widget/filter_container.dart';

class GridFacilityBuilder extends StatelessWidget {
  final int itemCount;
  final String label;
  final String? selectedType;
  final List<String> filterData;
  final Function(String?) onSelectionChanged;

  const GridFacilityBuilder({
    super.key,
    required this.itemCount,
    required this.selectedType,
    required this.label,
    required this.filterData,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            mainAxisExtent: 90.0,
          ),
          itemCount: itemCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return FilterContainer(
              text: filterData[index],
              color: Theme.of(context).colorScheme.primary,
              isSelected: selectedType == filterData[index],
              onSelectionChanged: () => onSelectionChanged(filterData[index]),
            );
          },
        ),
      ],
    );
  }
}

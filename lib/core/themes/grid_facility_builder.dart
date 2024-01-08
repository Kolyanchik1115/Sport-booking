import 'package:flutter/material.dart';
import 'package:sport_app/presentation/pages/search/widget/filter_container.dart';

class GridFacilityBuilder extends StatefulWidget {
  final int itemCount;
  final String label;
  final List<String> filterData;
  final Function(String?) onSelectionChanged;

  const GridFacilityBuilder({
    super.key,
    required this.itemCount,
    required this.label,
    required this.filterData,
    required this.onSelectionChanged,
  });

  @override
  GridFacilityBuilderState createState() => GridFacilityBuilderState();
}

class GridFacilityBuilderState extends State<GridFacilityBuilder> {
  int? selectedFilterIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.surfaceTint,
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
          itemCount: widget.itemCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return FilterContainer(
              text: widget.filterData[index],
              color: Theme.of(context).colorScheme.outline,
              isSelected: index == selectedFilterIndex,
              onSelectionChanged: () {
                setState(() {
                  selectedFilterIndex = index;
                  widget.onSelectionChanged(
                    selectedFilterIndex != null
                        ? widget.filterData[selectedFilterIndex!]
                        : null,
                  );
                });
              },
            );
          },
        ),
      ],
    );
  }
}

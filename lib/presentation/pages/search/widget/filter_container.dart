import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final VoidCallback onSelectionChanged;

  const FilterContainer({
    super.key,
    required this.text,
    required this.color,
    required this.isSelected,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectionChanged,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Theme.of(context).colorScheme.secondary : color),
          borderRadius: BorderRadius.circular(30.0),
          color: isSelected ? Theme.of(context).colorScheme.onPrimary : color,
        ),
        child: Align(alignment: Alignment.center, child: Text(text)),
      ),
    );
  }
}

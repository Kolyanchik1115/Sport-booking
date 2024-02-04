import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterContainer extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onSelectionChanged;

  const FilterContainer({
    super.key,
    required this.text,
    required this.icon,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 27.0,
              color: isSelected
                  ? Theme.of(context).colorScheme.onBackground
                  : Theme.of(context).colorScheme.background,
            ),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.background,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

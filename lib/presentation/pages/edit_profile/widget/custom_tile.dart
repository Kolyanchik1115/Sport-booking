import 'package:flutter/material.dart';

class CustomTileWidget extends StatelessWidget {
  final String title;
  final String label;
  final Widget? icon;
  final Function()? onTap;
  const CustomTileWidget({
    super.key,
    required this.title,
    required this.label,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.displayMedium),
              if (icon != null) icon!,
            ],
          ),
        ],
      ),
    );
  }
}

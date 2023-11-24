import 'package:flutter/material.dart';
import 'package:sport_app/core/themes/app_assets.dart';

class AppSwitch extends StatelessWidget {
  final bool isChecked;
  final Function(bool value) onChanged;

  const AppSwitch({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isChecked,
      activeThumbImage: const AssetImage(AppPng.night),
      inactiveThumbImage: const AssetImage(AppPng.day),
      activeColor: isChecked ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.shadow,
      inactiveTrackColor: Theme.of(context).colorScheme.outline,
      activeTrackColor: Theme.of(context).colorScheme.shadow,
      inactiveThumbColor: Theme.of(context).colorScheme.outline,
      onChanged: (value) => onChanged(value),
    );
  }
}

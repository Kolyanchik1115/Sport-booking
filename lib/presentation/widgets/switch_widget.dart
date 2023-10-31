import 'package:flutter/material.dart';

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
      activeColor: isChecked ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onPrimaryContainer,
      inactiveTrackColor: Theme.of(context).colorScheme.onSurface,
      inactiveThumbColor: Theme.of(context).colorScheme.background,
      onChanged: (value) => onChanged(value),
    );
  }
}

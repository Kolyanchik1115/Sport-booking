import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final Function() onPressed;

  const AppElevatedButton({
    super.key,
    this.textStyle,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}

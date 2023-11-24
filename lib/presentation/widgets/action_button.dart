import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final EdgeInsetsGeometry padding;
  final Function() onPressed;

  const ActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: Padding(
        padding: padding,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.outline),
          onPressed: onPressed,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 16.0,
                    width: 16.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  )
                : Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}

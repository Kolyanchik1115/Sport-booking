import 'package:flutter/material.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/app_elevated_button.dart';

class RowWithButtonWidget extends StatelessWidget {
  final String title;
  final String text;
  final Function() onPressed;
  const RowWithButtonWidget({
    super.key, required this.text, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
              ),
            ),
          ],
        ),
        AppElevatedButton(
          text: 'Change',
          textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
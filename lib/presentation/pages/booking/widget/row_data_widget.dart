import 'package:flutter/material.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/description_text_widget.dart';

class RowDataWidget extends StatelessWidget {
  final String title;
  final String? text;
  final String? description;

  const RowDataWidget({
    super.key,
    required this.title,
    this.text,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              ),
        ),
        const SizedBox(height: 5.0),
        if (text != null && text!.isNotEmpty)
          Text(
            text!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                ),
          ),
        if (description != null && (text == null || text!.isEmpty)) DescriptionTextWidget(text: description!),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/app_elevated_button.dart';

class RowWithButtonWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool isWorking;
  final Function() onPressed;

  const RowWithButtonWidget({
    super.key,
    required this.text,
    required this.title,
    required this.onPressed,
    required this.isWorking,
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
        isWorking
            ? AppElevatedButton(
                text: 'Change',
                textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
                onPressed: onPressed,
              )
            : Container(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppSvg.repair, width: 40.0)),
      ],
    );
  }
}

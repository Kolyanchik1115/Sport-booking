import 'package:flutter/material.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/app_elevated_button.dart';

class TotalRowWidget extends StatelessWidget {
  final double totalPrice;
  final List<int> selectedIdRange;
  final Function() onPressed;

  const TotalRowWidget({
    super.key,
    required this.totalPrice,
    required this.selectedIdRange,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Total:  ',
                  style:
                      Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '$totalPrice₴',
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: SizedBox(
              child: AppElevatedButton(
                text: 'Submit',
                textStyle: totalPrice != 0
                    ? Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        )
                    : Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

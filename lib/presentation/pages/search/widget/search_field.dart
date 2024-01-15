import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Function() onPressedRightButton;

  const SearchField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
    required this.onPressedRightButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoSearchTextField(
                focusNode: focusNode,
                padding: const EdgeInsets.all(8.0),
                onChanged: onChanged,
                controller: textEditingController,
                itemColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            TextButton(
              onPressed: onPressedRightButton,
              child: Text('All cities', style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}

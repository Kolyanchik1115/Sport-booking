import 'package:flutter/material.dart';
import 'default_input_text_field.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: Row(
        children: [
          Expanded(
            child: DefaultInputTextField(
              hintText: '',
              filled: true,
              focusNode: focusNode,
              onChanged: onChanged,
              textEditingController: textEditingController,
              placeText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.background),
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.secondary, size: 28.0),
            ),
          ),
          TextButton(
            onPressed: onPressedRightButton,
            child: Text('All cities', style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
    );
  }
}

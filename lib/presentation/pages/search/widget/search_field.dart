import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sport_app/presentation/widgets/default_input_text_field.dart';

class SearchField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String) onChanged;

  const SearchField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? searchDelayTimer;

  @override
  void dispose() {
    searchDelayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: DefaultInputTextField(
        focusNode: widget.focusNode,
        prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.secondary, size: 30.0),
        padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
        onChanged: (value) {
          searchDelayTimer?.cancel();
          searchDelayTimer = Timer(const Duration(milliseconds: 700), () {
            widget.onChanged(value);
            searchDelayTimer?.cancel();
          });
        },
        textEditingController: widget.textEditingController,
        hintText: '',
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        placeText: 'Search',
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.background),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18.0,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/empty_layout.dart';
import '../../widgets/search_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: SearchField(
        textEditingController: TextEditingController(),
        focusNode: FocusNode(),
        onChanged: (data) {},
        onPressedRightButton: () {},
      ),
    );
  }
}

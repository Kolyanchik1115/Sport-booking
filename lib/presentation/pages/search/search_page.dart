import 'package:flutter/material.dart';
import 'package:sport_app/presentation/pages/search/widget/facility_container.dart';

import '../../widgets/empty_layout.dart';
import 'widget/search_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      appbarColor: Theme.of(context).colorScheme.background,
      background: Theme.of(context).colorScheme.onSurface,
      child: Column(
        children: [
          SearchField(
            textEditingController: TextEditingController(),
            focusNode: FocusNode(),
            onChanged: (data) {},
            onPressedRightButton: () {},
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const FacilityContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

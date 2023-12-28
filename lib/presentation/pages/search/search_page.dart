import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/presentation/pages/search/cubit/facility_cubit.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

import 'widget/facility_container.dart';
import 'widget/search_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      appbarColor: Theme.of(context).colorScheme.background,
      background: Theme.of(context).colorScheme.onSurface,
      child: BlocProvider(
        create: (context) => FacilityPaginationCubit()..loadNextPage(),
        child: BlocBuilder<FacilityPaginationCubit, FacilityPaginationState>(
          builder: (context, state) {
            if (state.isLoading && state.currentPage == 1) {
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).colorScheme.outline),
              );
            }
            return Column(
              children: [
                SearchField(
                  textEditingController: TextEditingController(),
                  focusNode: FocusNode(),
                  onChanged: (data) {},
                  onPressedRightButton: () {},
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo is ScrollEndNotification &&
                          scrollInfo.metrics.pixels >= (scrollInfo.metrics.maxScrollExtent - 100) &&
                          !state.isLoading &&
                          !state.hasReachedEnd) {
                        context.read<FacilityPaginationCubit>().loadNextPage();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: state.data.length + (state.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.data.length && state.isLoading) {
                          return CircularProgressIndicator(color: Theme.of(context).colorScheme.outline);
                        } else {
                          return FacilityContainer(facility: state.data[index]);
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

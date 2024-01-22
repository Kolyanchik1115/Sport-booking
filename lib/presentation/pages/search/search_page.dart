import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/core/utils/dummy_data.dart';
import 'package:sport_app/presentation/pages/search/cubit/facility/facility_cubit.dart';
import 'package:sport_app/presentation/pages/search/cubit/filter/filter_cubit.dart';
import 'package:sport_app/presentation/pages/search/widget/facility_filter.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

import 'widget/facility_container.dart';
import 'widget/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final FacilityCubit facilityCubit;
  late final FilterCubit filterCubit;

  @override
  void initState() {
    facilityCubit = FacilityCubit();
    filterCubit = FilterCubit(
      sportTypeList: DummyData.sportType,
      coveringTypeList: DummyData.coveringType,
    );
    super.initState();
  }

  @override
  void dispose() {
    facilityCubit.close();
    filterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: facilityCubit..loadFirstPage(),
        ),
        BlocProvider.value(value: filterCubit),
      ],
      child: EmptyLayout(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            builder: (context) {
              return SingleChildScrollView(
                child: FacilityFilter(filterCubit: filterCubit),
              );
            },
          ).then((filterState) {
            if (filterState != null && filterState is FilterState) {
              facilityCubit.sportType = filterState.selectedSportType;
              facilityCubit.coveringType = filterState.selectedCoveringType;
              return facilityCubit.loadFirstPage();
            }
          }),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: SvgPicture.asset(AppSvg.filter, height: 16.0),
        ),
        appbarColor: Theme.of(context).colorScheme.background,
        background: Theme.of(context).colorScheme.onSurface,
        child: BlocBuilder<FacilityCubit, FacilityState>(
          builder: (context, state) {
            if (state.isLoading && state.currentPage == 1) {
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
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
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: (ScrollEndNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >= (scrollInfo.metrics.maxScrollExtent - 50) &&
                          !state.isLoading &&
                          !state.hasReachedEnd) {
                        context.read<FacilityCubit>().loadNextPage();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: state.data.length + (state.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.data.length && state.isLoading) {
                          return CircularProgressIndicator(color: Theme.of(context).colorScheme.primary);
                        } else {
                          return FacilityContainer(
                            facility: state.data[index],
                            onTap: () {},
                          );
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

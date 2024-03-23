import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/core/utils/dummy_data.dart';
import 'package:sport_app/presentation/pages/search/cubit/facility/facility_cubit.dart';
import 'package:sport_app/presentation/pages/search/cubit/filter/filter_cubit.dart';
import 'package:sport_app/presentation/pages/search/widget/facility_filter.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';
import 'package:sport_app/presentation/widgets/svg_button.dart';
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
  final SearchController searchController = SearchController();
  final FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    facilityCubit = FacilityCubit();
    filterCubit = FilterCubit(
      sportTypeList: DummyData.sportType,
      coveringTypeList: DummyData.coveringType,
      facilityTypeList: DummyData.facilityType,
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
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
              return SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.2,
                child: FacilityFilter(filterCubit: filterCubit),
              );
            },
          ).then((filterState) {
            if (filterState != null && filterState is FilterState) {
              facilityCubit.sportType = filterState.selectedSportType;
              facilityCubit.coveringType = filterState.selectedCoveringType;
              facilityCubit.facilityType = filterState.selectedFacilityType;
              return facilityCubit.loadFirstPage(search: searchController.text.trim());
            }
          }),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: SvgPicture.asset(AppSvg.filter, height: 16.0),
        ),
        appbarColor: Theme.of(context).colorScheme.background,
        background: Theme.of(context).colorScheme.onSurface,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(
                      textEditingController: searchController,
                      focusNode: searchFocus,
                      onChanged: (query) {
                        facilityCubit.onSearch(query.trim());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 13.0, bottom: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 40.0,
                      width: 40.0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgButton(
                          asset: AppSvg.map,
                          onTap: () => context.push(AppRoutes.facilitiesMap, extra: facilityCubit.state.data),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<FacilityCubit, FacilityState>(
              builder: (context, state) {
                if (state.isLoading && state.currentPage == 1) {
                  return Center(
                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                  );
                }
                return Expanded(
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
                            onTap: () => context.push(AppRoutes.facilityDetails, extra: state.data[index]),
                            onIconTap: () {},
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/favorite/cubit/favorite_cubit.dart';
import 'package:sport_app/presentation/pages/search/cubit/facility/facility_cubit.dart';
import 'package:sport_app/presentation/pages/search/widget/facility_container.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: injector<FavoriteCubit>(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) => injector<FacilityCubit>()..localRemoveFromFavorite(state.removedListId),
        listenWhen: (prev, curr) => curr.removedListId.isNotEmpty,
        builder: (context, state) {
          if (state.data.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.75), shape: BoxShape.circle),
                      ),
                      SvgPicture.asset(AppSvg.favorite, height: 60),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('No favorites yet!', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text('Like a facility you see? Save\n them here to your favorites',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return FacilityContainer(
                facility: state.data[index],
                onTap: () => context.push(AppRoutes.facilityDetails, extra: state.data[index]),
                onIconTap: () => context.read<FavoriteCubit>().removeFavorite(facilityId: state.data[index].id),
              );
            },
          );
        },
      ),
    );
  }
}

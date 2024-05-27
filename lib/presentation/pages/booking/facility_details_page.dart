import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking/booking_cubit.dart';
import 'package:sport_app/presentation/pages/booking/cubit/day_of_week/day_of_week_cubit.dart';
import 'package:sport_app/presentation/pages/booking/widget/dotted_carousel.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_data_widget.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_with_button_widget.dart';
import 'package:sport_app/presentation/pages/search/cubit/facility/facility_cubit.dart';

class FacilityDetailsPage extends StatelessWidget {
  final FacilityData facilityData;

  const FacilityDetailsPage({super.key, required this.facilityData});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "New reservation",
      centerTitle: true,
      child: BlocProvider(
        create: (context) => BookingCubit(),
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DottedCarousel(facilityData: facilityData),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        facilityData.name,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          facilityData.avgPrice != null ? '~ ${facilityData.avgPrice}₴' : '',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.onBackground,
                                          ),
                                        ),
                                        Text(
                                          facilityData.avgPrice != null ? 'in hour' : '',
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppSvg.location, height: 10.0),
                                    const SizedBox(width: 13.0),
                                    Text(
                                      facilityData.address ?? 'Unknown address',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15.0),
                                RowWithButtonWidget(
                                  title: 'Time',
                                  text: state.dates.isEmpty
                                      ? injector<FacilityCubit>()
                                      .state
                                      .data[injector<FacilityCubit>()
                                      .state
                                      .data
                                      .indexWhere((facility) => facility.id == facilityData.id)]
                                      .isWorking
                                      ? 'Select your schedule time'
                                      : 'Temporarily not working'
                                      : '${state.dates.first.hour.toString().padLeft(2, '0')}:'
                                      '${state.dates.first.minute.toString().padLeft(2, '0')} '
                                      '- ${state.dates.last.hour.toString().padLeft(2, '0')}'
                                      ':${state.dates.last.minute.toString().padLeft(2, '0')}',
                                  onPressed: () => context.push(
                                    AppRoutes.facilityBooking,
                                    extra: [facilityData.id, context.read<BookingCubit>()],
                                  ),
                                  isWorking: injector<FacilityCubit>()
                                      .state
                                      .data[injector<FacilityCubit>()
                                      .state
                                      .data
                                      .indexWhere((facility) => facility.id == facilityData.id)]
                                      .isWorking,
                                ),
                                const SizedBox(height: 15.0),
                                RowDataWidget(title: 'Type', text: facilityData.facilityType ?? ''),
                                const SizedBox(height: 15.0),
                                RowDataWidget(
                                    title: 'Type of coating', text: '${facilityData.coveringType ?? ''}, other'),
                                const SizedBox(height: 15.0),
                                RowDataWidget(title: 'Description', description: facilityData.description ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              state.totalPrice != 0 ? '${state.totalPrice}₴' : '0.0₴',
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
                            textStyle: state.totalPrice != 0
                                ? Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            )
                                : Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              if (state.totalPrice != 0 && state.cells.isNotEmpty) {
                                return context.push(AppRoutes.confirmBooking,
                                    extra: [facilityData, context.read<BookingCubit>()]);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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

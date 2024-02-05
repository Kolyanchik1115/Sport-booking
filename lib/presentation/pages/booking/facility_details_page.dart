import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:sport_app/presentation/pages/booking/widget/dotted_carousel.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_data_widget.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_with_button_widget.dart';
import 'package:sport_app/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class FacilityDetailsPage extends StatefulWidget {
  final FacilityData facilityData;

  const FacilityDetailsPage({super.key, required this.facilityData});

  @override
  State<FacilityDetailsPage> createState() => _FacilityDetailsPageState();
}

class _FacilityDetailsPageState extends State<FacilityDetailsPage> {
  late final BookingCubit bookingCubit;

  @override
  void initState() {
    bookingCubit = BookingCubit();
    super.initState();
  }

  @override
  void dispose() {
    bookingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "New reservation",
      centerTitle: true,
      child: BlocProvider.value(
        value: bookingCubit,
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
                          DottedCarousel(facilityData: widget.facilityData),
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
                                        widget.facilityData.name,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              color: Theme.of(context).colorScheme.onBackground,
                                            ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.facilityData.avgPrice != null
                                              ? '~ ${widget.facilityData.avgPrice}₴'
                                              : '',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                color: Theme.of(context).colorScheme.onBackground,
                                              ),
                                        ),
                                        Text(
                                          widget.facilityData.avgPrice != null ? 'in hour' : '',
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
                                      widget.facilityData.address ?? 'Unknown address',
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
                                      ? 'Select your schedule time'
                                      : '${state.dates.first.hour.toString().padLeft(2, '0')}:'
                                          '${state.dates.first.minute.toString().padLeft(2, '0')} '
                                          '- ${state.dates.last.hour.toString().padLeft(2, '0')}'
                                          ':${state.dates.last.minute.toString().padLeft(2, '0')}',
                                  onPressed: () => context.push(
                                    AppRoutes.facilityBooking,
                                    extra: [widget.facilityData.id, bookingCubit],
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                RowDataWidget(title: 'Type', text: widget.facilityData.facilityType ?? ''),
                                const SizedBox(height: 15.0),
                                RowDataWidget(
                                    title: 'Type of coating', text: '${widget.facilityData.coveringType ?? ''}, other'),
                                const SizedBox(height: 15.0),
                                RowDataWidget(title: 'Description', description: widget.facilityData.description ?? ''),
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
                              state.price != null ? '${state.price}₴' : '0.0₴',
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
                            textStyle: state.price != null
                                ? Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.background,
                                    )
                                : Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                            onPressed: () {
                              if (state.price != null && state.cells.isNotEmpty) {
                                return context.push(AppRoutes.confirmBooking, extra: state.price);
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/presentation/pages/facility_details/widget/dotted_carousel.dart';
import 'package:sport_app/presentation/pages/facility_details/widget/row_data_widget.dart';
import 'package:sport_app/presentation/pages/facility_details/widget/row_with_button_widget.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class FacilityDetailsPage extends StatelessWidget {
  final FacilityData facilityData;

  const FacilityDetailsPage({super.key, required this.facilityData});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "New reservation",
      centerTitle: true,
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
                              '~ 400₴',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onBackground,
                                  ),
                            ),
                            Text(
                              'in hour',
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
                    const SizedBox(height: 30.0),
                    RowWithButtonWidget(
                      title: 'Date',
                      text: '${DateTime.now().day} january ${DateTime.now().year}',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 15.0),
                    RowWithButtonWidget(
                      title: 'Time',
                      text: 'Select your schedule time',
                      onPressed: () => context.push(AppRoutes.facilityBooking),
                    ),
                    const SizedBox(height: 15.0),
                    RowDataWidget(title: 'Type', text: facilityData.facilityType ?? ''),
                    const SizedBox(height: 15.0),
                    RowDataWidget(title: 'Type of coating', text: '${facilityData.coveringType ?? ''}, other'),
                    const SizedBox(height: 15.0),
                    RowDataWidget(title: 'Description', description: facilityData.description ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

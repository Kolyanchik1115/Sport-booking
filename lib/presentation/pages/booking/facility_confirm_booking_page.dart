import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/dummy_data.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_data_widget.dart';
import 'package:sport_app/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class FacilityConfirmBookingPage extends StatelessWidget {
  final double price;
  final List<DateTime> dates;
  final FacilityData facilityData;
  final DateTime dateTime;
  final List<int> cells;

  const FacilityConfirmBookingPage({
    super.key,
    required this.price,
    required this.dates,
    required this.facilityData,
    required this.dateTime,
    required this.cells,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "Confirm reservation",
      centerTitle: true,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Upper Part
                const SizedBox(height: 10.0),
                Text(
                  "Club name",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text(facilityData.name),
                const SizedBox(height: 5.0),
                Text(
                  "Reservation №",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const Text("1234567"),
                const SizedBox(height: 5.0),
                Text(
                  "Address",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text("${facilityData.address ?? "Unknown address"} / ${facilityData.district ?? "Unknown district"}"),
                const SizedBox(height: 10.0),
                const Divider(color: Colors.black),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowDataWidget(title: 'Date', text: '${dateTime.day} ${DummyData.monthNames[dateTime.month - 1]}'),
                      RowDataWidget(
                          title: 'Reserve time',
                          text: '${dates.first.hour.toString().padLeft(2, '0')}:'
                              '${dates.first.minute.toString().padLeft(2, '0')} '
                              '- ${dates.last.hour.toString().padLeft(2, '0')}'
                              ':${dates.last.minute.toString().padLeft(2, '0')}'),
                      Text('${(dates.first.difference(dates.last).abs().inMinutes / 60).toStringAsFixed(1)} h'),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowDataWidget(title: 'Sport type', text: facilityData.sportType),
                      RowDataWidget(title: 'Type', text: facilityData.facilityType),
                      RowDataWidget(title: 'Covering type', text: facilityData.coveringType),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total:  ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      '$price₴',
                      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 120,
                      child: AppElevatedButton(
                        text: 'Reserve',
                        textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                        onPressed: () {
                          context.push(AppRoutes.payment, extra: [
                            price,
                            facilityData.name,
                            facilityData.id,
                            cells,
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

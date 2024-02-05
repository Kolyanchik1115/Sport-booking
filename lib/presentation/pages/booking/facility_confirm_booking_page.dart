import 'package:flutter/material.dart';
import 'package:sport_app/presentation/pages/booking/widget/row_data_widget.dart';
import 'package:sport_app/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class FacilityConfirmBookingPage extends StatelessWidget {
  final double price;

  const FacilityConfirmBookingPage({super.key, required this.price});

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
                const Text("Long club name with additional information"),
                const SizedBox(height: 5.0),
                Text(
                  "Reservation №",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const Text("Unique reservation number: ABC123456"),
                const SizedBox(height: 5.0),
                Text(
                  "Address",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const Text("1234 Street, City, Country"),
                const SizedBox(height: 10.0),
                const Divider(color: Colors.black),
                const SizedBox(height: 30.0),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowDataWidget(title: 'Date', text: '06 February 2024'),
                      RowDataWidget(title: 'Reserve time', text: '15-00:16:00'),
                      Text('1h'),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowDataWidget(title: 'Sport type', text: 'basketball'),
                      RowDataWidget(title: 'Type', text: 'outdoor'),
                      RowDataWidget(title: 'Covering type', text: 'rubber'),
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
                        onPressed: () {},
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

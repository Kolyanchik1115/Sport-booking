import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking/booking_cubit.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "My reservations",
      canPop: false,
      child: BlocProvider(
        create: (context) => BookingCubit()..getBookings(),
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            return RefreshIndicator(
              onRefresh: () async {
                context.read<BookingCubit>().getBookings();
              },
              child: ListView.builder(
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final booking = state.bookings[index];
                  Color statusColor;
                  switch (booking.status) {
                    case 'success':
                      statusColor = Colors.green;
                      break;
                    case 'pending':
                      statusColor = Colors.orange;
                      break;
                    case 'failed':
                      statusColor = Colors.red;
                      break;
                    default:
                      statusColor = Colors.grey;
                      break;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: booking.facility.images.isNotEmpty
                              ? Image.network(
                                  injector<SportAppApi>().imageFromDB(booking.facility.images.first),
                                  width: 160,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fDB8fHww',
                                  width: 160,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: statusColor,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        booking.status,
                                        style: TextStyle(color: statusColor, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '№ ${booking.id}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                booking.facility.name,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Date:',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${booking.startTime.day.toString().padLeft(2, '0')}.${booking.startTime.month.toString().padLeft(2, '0')}.${booking.startTime.year.toString()}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Time:',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${booking.startTime.hour.toString().padLeft(2, '0')}:'
                                          '${booking.startTime.minute.toString().padLeft(2, '0')}',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

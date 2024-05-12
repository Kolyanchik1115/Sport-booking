import 'package:flutter/material.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:sport_app/injector.dart';

class ReservationPage extends StatelessWidget {
  final String description;
  final DateTime date;
  final DateTime time;
  final String number;
  final String image;

  ReservationPage({
    super.key,
    required this.description,
    required this.date,
    required this.time,
    required this.number,
    required this.image,
  });

  final List<Map<String, dynamic>> items = [
    {
      'status': 'оплачен',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      appBarTitle: "My reservations",
      canPop: false,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          Color statusColor;
          switch (item['status']) {
            case 'оплачен':
              statusColor = Colors.green;
              break;
            case 'в ожидании':
              statusColor = Colors.orange;
              break;
            case 'отменен':
              statusColor = Colors.red;
              break;
            default:
              statusColor = Colors.grey;
              break;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: image.isNotEmpty
                          ? Image.network(
                              injector<SportAppApi>().imageFromDB(image),
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
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration:
                                          BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(6)),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['status'],
                                      style: TextStyle(color: statusColor, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '№ ${number.substring(0, number.indexOf(RegExp(r'[a-zA-Z]')))}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(description, style: Theme.of(context).textTheme.headline6),
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
                                    '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.2024',
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
                                      '${time.hour.toString().padLeft(2, '0')}:'
                                      '${time.minute.toString().padLeft(2, '0')} ',
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
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'emty_cell_list_tile.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';

class CellsListViewBuilder extends StatelessWidget {
  final double itemExtend;
  final List<List<BookingTimeSlotsModel>> scheduleData;
  final List<String> daysOfWeek;
  final int selectedDay;
  final List<int> selectedIdRange;
  final Function(int) onTap;

  const CellsListViewBuilder({
    super.key,
    required this.itemExtend,
    required this.scheduleData,
    required this.daysOfWeek,
    required this.selectedDay,
    required this.selectedIdRange,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final timeSlots = scheduleData[selectedDay];
    return Expanded(
      child: ListView.builder(
        itemCount: timeSlots.length + 1,
        padding: const EdgeInsets.only(top: 25.0),
        itemExtent: itemExtend,
        itemBuilder: (context, index) {
          if (index < timeSlots.length) {
            final slot = timeSlots[index];
            final price = slot.price.toDouble();
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              leading: SizedBox(
                width: itemExtend + 5,
                child: Transform.translate(
                  offset: Offset(0, -itemExtend / 2),
                  child: Text(
                    '${slot.startTime.hour.toString().padLeft(2, '0')}:${slot.startTime.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ),
              subtitle: InkWell(
                onTap: () => onTap(index),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isNumberInRange(slot.id, selectedIdRange)
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                        : Colors.transparent,
                    border: Border(
                      left: BorderSide(
                        color: price != 0 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        width: 4.0,
                      ),
                      top: const BorderSide(color: Colors.black, width: 0.2),
                    ),
                  ),
                  child: Center(
                    child: price != 0
                        ? Text(
                            '$price₴',
                            style: const TextStyle(color: Colors.black),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            );
          } else {
            return EmptyCellListTile(
              itemExtend: itemExtend,
              lastCellEndTime: timeSlots.isNotEmpty ? timeSlots.last.endTime : DateTime.now(),
            );
          }
        },
      ),
    );
  }

  bool isNumberInRange(int value, List<int> range) {
    if (range.isEmpty) return false;
    return value >= range.first && value <= range.last;
  }
}

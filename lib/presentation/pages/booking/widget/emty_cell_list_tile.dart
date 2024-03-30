import 'package:flutter/material.dart';

class EmptyCellListTile extends StatelessWidget {
  final double itemExtend;
  final DateTime lastCellEndTime;
  const EmptyCellListTile({
    super.key,
    required this.itemExtend,
    required this.lastCellEndTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: SizedBox(
        width: itemExtend + 5,
        child: Transform.translate(
          offset: Offset(0, -itemExtend / 2),
          child: Text(
            '${lastCellEndTime.hour.toString().padLeft(2, '0')}:${lastCellEndTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      ),
      subtitle: const InkWell(
        onTap: null,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              left: BorderSide(
                color: Colors.transparent,
                width: 4.0,
              ),
              top: BorderSide(color: Colors.black, width: 0.2),
            ),
          ),
          child: Center(
            child: SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
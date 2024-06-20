import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/styles.dart';

class AddDateTimeContainer extends StatelessWidget {
  const AddDateTimeContainer({
    super.key,
    required this.onDateChange,
  });

  final Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 8),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color(0xFFA0A2F9),
        selectedTextColor: Colors.white,
        dateTextStyle: Styles.fontSizeBold20,
        onDateChange: onDateChange,
      ),
    );
  }
}

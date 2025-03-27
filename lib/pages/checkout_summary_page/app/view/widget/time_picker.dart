import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  TimePickerWidgetState createState() => TimePickerWidgetState();
}

class TimePickerWidgetState extends State<TimePickerWidget> {
  final TextEditingController _timeController = TextEditingController();
  final DateFormat _timeFormat = DateFormat('hh:mm a');
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _timeController.text = _formatTime(_selectedTime!);
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedDateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return _timeFormat.format(formattedDateTime);
  }

  void _showCustomBottomSheet(BuildContext context) {
    TimeOfDay tempTime = _selectedTime!;
    openCustomBottomSheet(
      context: context,
      child: TimePickerBottomSheet(
        initialTime: tempTime,
        onTimeChanged: (TimeOfDay newTime) {
          tempTime = newTime;
        },
        onConfirm: () {
          setState(() {
            _selectedTime = tempTime;
            _timeController.text = _formatTime(_selectedTime!);
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select time",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish",
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _showCustomBottomSheet(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _timeController.text,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.clock,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                    width: 15,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
}

class TimePickerBottomSheet extends StatelessWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeChanged;
  final VoidCallback onConfirm;

  const TimePickerBottomSheet({
    required this.initialTime,
    required this.onTimeChanged,
    required this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Select Time",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TimePickerSpinner(
            is24HourMode: true,
            normalTextStyle:
                const TextStyle(fontSize: 18, color: Colors.black54),
            highlightedTextStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.teal,
            ),
            spacing: 50,
            itemHeight: 40,
            isForce2Digits: true,
            time: DateTime.now(),
            onTimeChange: (time) {
              onTimeChanged(
                TimeOfDay(
                  hour: time.hour,
                  minute: time.minute,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SolidButtonWidget(
              label: "Done",
              onPressed: onConfirm,
              isCircle: true,
            ),
          )
        ],
      ),
    );
  }
}

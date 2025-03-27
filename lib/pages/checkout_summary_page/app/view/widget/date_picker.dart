import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late final TextEditingController _dateController;
  late DateTime _selectedDate;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateController =
        TextEditingController(text: _dateFormat.format(_selectedDate));
  }

  void _showCustomBottomSheet(BuildContext context) {
    DateTime tempDate = _selectedDate;

    openCustomBottomSheet(
      context: context,
      child: _buildBottomSheetContent(context, tempDate),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context, DateTime tempDate) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Select Date",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish",
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          StatefulBuilder(
            builder: (context, setModalState) {
              return SizedBox(
                height: 200,
                child: CalendarDatePicker(
                  initialDate: tempDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onDateChanged: (date) {
                    tempDate = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      tempDate.hour,
                      tempDate.minute,
                    );
                    setModalState(() {});
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          SolidButtonWidget(
            label: "Done",
            onPressed: () {
              setState(() {
                _selectedDate = DateTime(
                  tempDate.year,
                  tempDate.month,
                  tempDate.day,
                  _selectedDate.hour,
                  _selectedDate.minute,
                );
                _dateController.text = _dateFormat.format(_selectedDate);
              });
              Navigator.pop(context);
            },
            isCircle: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select date",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _showCustomBottomSheet(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.teal, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _dateController.text,
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
                    AppIcons.calendarDay,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
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
    _dateController.dispose();
    super.dispose();
  }
}

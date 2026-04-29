import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/calender.dart';


class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Color> _getEvents(DateTime day, CalendarProvider provider) {
    final map = provider.events[
    DateTime(day.year, day.month, day.day)
    ];

    if (map == null) return [];

    return map.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalendarProvider>();

    return Column(
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navButton(Icons.arrow_back_ios, () {
              setState(() {
                _focusedDay =
                    DateTime(_focusedDay.year, _focusedDay.month - 1);
              });
            }),

            Column(
              children: [
                Text(
                  _monthName(_focusedDay.month),
                  style: const TextStyle(fontSize: 20),
                ),
                Text("${_focusedDay.year}"),
              ],
            ),

            _navButton(Icons.arrow_forward_ios, () {
              setState(() {
                _focusedDay =
                    DateTime(_focusedDay.year, _focusedDay.month + 1);
              });
            }),
          ],
        ),

        const SizedBox(height: 20),

        /// CALENDAR
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(2000),
          lastDay: DateTime(2100),
          headerVisible: false,
          sixWeekMonthsEnforced: true,

          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },

          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },

          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },

          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              return _dayCell(day, false, _getEvents(day, provider));
            },
            selectedBuilder: (context, day, focusedDay) {
              return _dayCell(day, true, _getEvents(day, provider));
            },
          ),
        ),

        const Divider(),
      ],
    );
  }

  /// DAY CELL
  Widget _dayCell(DateTime day, bool isSelected, List<Color> dots) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffCF3232) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "${day.day}",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots.map((color) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 1.3,
                )
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _navButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon),
    );
  }

  String _monthName(int month) {
    const months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return months[month - 1];
  }
}
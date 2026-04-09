import 'package:event_management_app/widgets/resuble_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<Color>> events = {
    DateTime(2025, 9, 2): [Colors.red, Colors.blue, Colors.green],
    DateTime(2025, 9, 3): [Colors.blue, Colors.red],
    DateTime(2025, 9, 6): [Colors.green],
    DateTime(2025, 9, 13): [Colors.blue, Colors.red],
    DateTime(2025, 9, 15): [Colors.green, Colors.red],
  };

  List<Color> _getEvents(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        /// 🔝 Custom Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navButton(Icons.arrow_back_ios, () {
              setState(() {
                _focusedDay = DateTime(
                  _focusedDay.year,
                  _focusedDay.month - 1,
                );
              });
            }),

            Column(
              children: [
                customText("${_monthName(_focusedDay.month)}",
                fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),

                customText("${_focusedDay.year}",
                fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8F9BB3)
                ),

              ],
            ),

            _navButton(Icons.arrow_forward_ios, () {
              setState(() {
                _focusedDay = DateTime(
                  _focusedDay.year,
                  _focusedDay.month + 1,
                );
              });
            }),
          ],
        ),

        const SizedBox(height: 20),

        /// 📅 Calendar
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(2000),
          lastDay: DateTime(2100),


          calendarFormat: CalendarFormat.month,
          sixWeekMonthsEnforced: true,

          headerVisible: false,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
                color: Color(0xff8F9BB3)
            ),
          ),

          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },

          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },

          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final eventDots = _getEvents(day);

              return _dayCell(day, false, eventDots);
            },

            selectedBuilder: (context, day, focusedDay) {
              final eventDots = _getEvents(day);

              return _dayCell(day, true, eventDots);
            },


          ),
        ),
        Divider()
      ],
    );

  }

  /// 📦 Day Cell UI
  Widget _dayCell(DateTime day, bool isSelected, List<Color> dots) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xffCF3232) : Colors.transparent,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            "${day.day}",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isSelected ? Colors.white : Color(0xff222B45),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots
              .map((color) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ))
              .toList(),
        ),
      ],
    );
  }

  /// 🔘 Navigation Button
  Widget _navButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,size: 21,),
    );
  }

  /// 📅 Month Name
  String _monthName(int month) {
    const months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return months[month - 1];
  }
}
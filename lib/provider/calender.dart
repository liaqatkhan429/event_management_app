import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  final Map<DateTime, Map<String, Color>> _events = {};

  Map<DateTime, Map<String, Color>> get events => _events;

  DateTime _normalize(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  final List<Color> colors = [
    Color(0xff0095FF),
    Color(0xffCF3232),
    Color(0xff00B383),
  ];

  bool addEvent(DateTime date, String eventId) {
    final key = _normalize(date);

    _events.putIfAbsent(key, () => {});

    if (_events[key]!.containsKey(eventId)) {
      return false; // already exists
    }

    final colorIndex = _events[key]!.length % colors.length;
    _events[key]![eventId] = colors[colorIndex];

    notifyListeners();
    return true;
  }
}
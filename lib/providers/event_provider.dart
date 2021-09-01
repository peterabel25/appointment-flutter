import 'package:auntie_rafiki_appointments/models/event.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [
    Event(
        id: 1,
        date: "08-31-2021",
        time: "12:15",
        name: "event1",
        category: "fund_raising",
        description: "we want to buy a field bus",
        location: "qlicue",
        featuredImage: "https://placekitten.com/500/500"),
    Event(
        id: 2,
        date: "12-31-2020",
        time: "12:15",
        name: "event2",
        category: "parte",
        description: "parte after parte",
        location: "iClick",
        featuredImage: "https://placekitten.com/500/500")
  ];

  List<Event> get events => _events;

  Event getEventById(int id) {
    final event = _events.firstWhere((element) => element.id == id);
    return event;
  }

  void addEvent() {
    final Event event = Event(
        id: 3,
        date: "08-31-2021",
        time: "12:15",
        name: "event3",
        category: "betting ",
        description: "we want to win bets",
        location: "iqlik",
        featuredImage: "https://placekitten.com/500/500");

    _events.add(event);
    notifyListeners();
  }

  bool deleteEvent(int id) {
    if (id < 1) return false;

    final event = _events.firstWhere((element) => element.id == id);

    if (event is Event) {
      _events.removeWhere((element) => element.id == id);
      notifyListeners();

      return true;
    }

    return false;
  }
}

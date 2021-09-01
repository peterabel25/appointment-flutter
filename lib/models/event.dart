import 'package:flutter/material.dart';

class Event {
  final int id;

  final String name;

  final String category;

  final String description;

  final String location;

  final String featuredImage;

  final String date;

  final String time;

  Event(
      {required this.id,
      required this.date,
      required this.time,
      required this.name,
      required this.category,
      required this.description,
      required this.location,
      required this.featuredImage});
}




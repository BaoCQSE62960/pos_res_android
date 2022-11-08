import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Shift {
  Shift({
    required this.id,
    required this.name,
    required this.starttime,
    required this.endtime,
  });

  final int id;
  final String name;
  final TimeOfDay starttime;
  final TimeOfDay endtime;

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'],
      name: json['name'],
      starttime: TimeOfDay.fromDateTime(
          DateFormat('HH:mm:ss').parse(json['starttime'])),
      endtime:
          TimeOfDay.fromDateTime(DateFormat('HH:mm:ss').parse(json['endtime'])),
    );
  }
}

class ListShift {
  final List<Shift> list;
  ListShift({required this.list});

  factory ListShift.fromJson(List<dynamic> parseJson) {
    List<Shift> list = parseJson.map((e) => Shift.fromJson(e)).toList();
    return ListShift(list: list);
  }
}

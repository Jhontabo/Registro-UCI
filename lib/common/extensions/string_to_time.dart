import 'package:flutter/material.dart';

extension ToDayTime on String {
  TimeOfDay toDayTime() {
    final splitted = split(':');
    final hours = splitted[0];
    final minutes = splitted[1];

    return TimeOfDay(
      hour: int.parse(hours),
      minute: int.parse(minutes),
    );
  }
}

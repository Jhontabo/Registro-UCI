import 'package:flutter/material.dart';

Future<DateTime?> pickDate(DateTime? initialDate, BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
      locale: const Locale('es', "ES"),
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: initialDate ?? DateTime.now(),
      errorInvalidText: "Fecha Invalida");
  return pickedDate;
}

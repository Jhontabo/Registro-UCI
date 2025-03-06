import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ✅ Importado para el manejo de fechas

/// 🔹 Valida la fecha de colocación del marcapaso.
String? fechaColocacionValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "La fecha de colocación es obligatoria.";
  }
  try {
    DateFormat('yyyy-MM-dd')
        .parseStrict(value.trim()); // ✅ Verifica el formato correcto
    return null;
  } catch (_) {
    return "Ingrese una fecha válida (Formato: YYYY-MM-DD).";
  }
}

/// 🔹 Valida que el modo del marcapaso haya sido seleccionado.
String? modoMarcapasoValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Debe seleccionar un modo de marcapaso.";
  }
  return null;
}

/// 🔹 Valida que la vía del marcapaso haya sido seleccionada.
String? viaMarcapasoValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Debe seleccionar una vía de marcapaso.";
  }
  return null;
}

/// 🔹 Valida que la frecuencia sea un número válido y mayor que 0.
String? frecuenciaMarcapasoValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Debe ingresar una frecuencia válida.";
  }
  final int? frecuencia = int.tryParse(value.trim());
  if (frecuencia == null || frecuencia <= 0) {
    return "La frecuencia debe ser un número entero positivo.";
  }
  return null;
}

/// 🔹 Valida que la sensibilidad sea un número válido y mayor que 0.
String? sensibilidadMarcapasoValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Debe ingresar una sensibilidad válida.";
  }
  final double? sensibilidad = double.tryParse(value.trim());
  if (sensibilidad == null || sensibilidad <= 0) {
    return "La sensibilidad debe ser un número mayor a 0.";
  }
  return null;
}

/// 🔹 Valida que la salida sea un número válido y mayor que 0.
String? salidaMarcapasoValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Debe ingresar una salida válida.";
  }
  final double? salida = double.tryParse(value.trim());
  if (salida == null || salida <= 0) {
    return "La salida debe ser un número mayor a 0.";
  }
  return null;
}

import 'package:flutter/material.dart';

/// Valida la fecha de colocación del marcapaso.
String? fechaColocacionValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "La fecha de colocación es obligatoria.";
  }
  return null;
}

/// Valida que el modo del marcapaso haya sido seleccionado.
String? modoMarcapasoValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Debe seleccionar un modo de marcapaso.";
  }
  return null;
}

/// Valida que la vía del marcapaso haya sido seleccionada.
String? viaMarcapasoValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Debe seleccionar una vía de marcapaso.";
  }
  return null;
}

/// Valida que la frecuencia sea un número válido y mayor que 0.
String? frecuenciaMarcapasoValidator(int? value) {
  if (value == null || value <= 0) {
    return "Debe ingresar una frecuencia válida.";
  }
  return null;
}

/// Valida que la sensibilidad sea un número válido y mayor que 0.
String? sensibilidadMarcapasoValidator(double? value) {
  if (value == null || value <= 0) {
    return "Debe ingresar una sensibilidad válida.";
  }
  return null;
}

/// Valida que la salida sea un número válido y mayor que 0.
String? salidaMarcapasoValidator(double? value) {
  if (value == null || value <= 0) {
    return "Debe ingresar una salida válida.";
  }
  return null;
}

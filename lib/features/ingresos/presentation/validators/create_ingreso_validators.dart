// Validaciones

String? Function(String?) nombrePacienteValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) identificacionPacienteValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Introduce un número válido';
  }
  return null;
};

String? Function(String?) carpetaValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Solo se permiten números';
  }
  return null;
};

String? Function(String?) epsOArlValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) fechaNacimientoValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  // Validar el formato YYYY-MM-DD
  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
    return 'Formato de fecha incorrecto (YYYY-MM-DD)';
  }
  return null;
};

String? Function(String?) pesoValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)) {
    return 'Introduce un peso válido';
  }
  return null;
};

String? Function(String?) tallaValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)) {
    return 'Introduce una talla válida (ej. 170 o 170.5)';
  }
  return null;
};

String? Function(String?) camaValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) diagnosticoIngresoValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) nombreFamiliarValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) parentescoFamiliarValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

String? Function(String?) salaValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  return null;
};

// Validación del campo "Otro" en parentesco familiar
String? Function(String?) otherParentescoFamiliarValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Debes especificar el parentesco';
  }
  return null;
};

String? Function(String?) otherEpsArlValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Debes especificar la EPS o ARL';
  }
  return null;
};

// Validación del teléfono, asegurando entre 7 y 15 dígitos
String? Function(String?) telefonoFamiliarValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  } else if (!RegExp(r'^\d{7,15}$').hasMatch(value)) {
    return 'El número debe tener entre 7 y 15 dígitos';
  }
  return null;
};

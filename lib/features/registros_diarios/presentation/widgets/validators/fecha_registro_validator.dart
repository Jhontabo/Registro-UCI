String? Function(String?) fechaRegistroValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo es obligatorio';
  }
  // Add date validation logic if necessary
  return null;
};

String? Function(String?) passwordValidator = (String? value) {
  if (value == null || value == '') {
    return 'Este campo es obligatorio';
  }
  return null;
};

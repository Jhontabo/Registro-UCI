class SessionExpiredError implements Exception {
  final String error;

  SessionExpiredError([
    this.error = 'Sesión expirada. Vuelva a Iniciar Sesión',
  ]);

  @override
  String toString() {
    return error;
  }
}

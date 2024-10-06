import 'package:flutter/foundation.dart';

@immutable
class ReporteParams {
  final String idIngreso;
  final String idRegistro;

  const ReporteParams({
    required this.idIngreso,
    required this.idRegistro,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReporteParams &&
        other.idIngreso == idIngreso &&
        other.idRegistro == idRegistro;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistro);
}

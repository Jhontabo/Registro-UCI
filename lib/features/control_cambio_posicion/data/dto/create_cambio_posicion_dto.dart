import 'dart:collection';

class CreateCambioPosicionDto extends MapView<String, dynamic> {
  final String posicion;
  final int hora;
  final int orden;
  final String? observaciones;
  final String? responsable;

  CreateCambioPosicionDto({
    required this.posicion,
    required this.hora,
    required this.orden,
    this.observaciones,
    this.responsable,
  }) : super({
          'posicion': posicion,
          'hora': hora,
          'orden': orden,
          if (observaciones != null) 'observaciones': observaciones,
          if (responsable != null) 'responsable': responsable,
        }) {
    // Validaciones en el constructor
    _validarParametros();
  }

  // Método de validación
  void _validarParametros() {
    if (posicion.isEmpty) {
      throw ArgumentError('La posición no puede estar vacía');
    }
    if (hora < 0 || hora > 23) {
      throw ArgumentError('La hora debe estar entre 0 y 23');
    }
    if (orden <= 0) {
      throw ArgumentError('El orden debe ser mayor a 0');
    }
    if (observaciones?.isEmpty ?? false) {
      throw ArgumentError(
          'Las observaciones no pueden estar vacías si se proporcionan');
    }
    if (responsable?.isEmpty ?? false) {
      throw ArgumentError(
          'El responsable no puede estar vacío si se proporciona');
    }
  }

  // Método para Firestore
  Map<String, dynamic> toFirestore() => Map<String, dynamic>.from(this);

  // Factory desde Firestore
  factory CreateCambioPosicionDto.fromFirestore(Map<String, dynamic> map) {
    return CreateCambioPosicionDto(
      posicion: map['posicion'] as String,
      hora: map['hora'] as int,
      orden: map['orden'] as int,
      observaciones: map['observaciones'] as String?,
      responsable: map['responsable'] as String?,
    );
  }

  // Factory desde JSON (para APIs)
  factory CreateCambioPosicionDto.fromJson(Map<String, dynamic> json) {
    return CreateCambioPosicionDto.fromFirestore(json);
  }

  // Método para convertir a JSON (para APIs)
  Map<String, dynamic> toJson() => toFirestore();

  // Método copyWith para actualizaciones parciales
  CreateCambioPosicionDto copyWith({
    String? posicion,
    int? hora,
    int? orden,
    String? observaciones,
    String? responsable,
  }) {
    return CreateCambioPosicionDto(
      posicion: posicion ?? this.posicion,
      hora: hora ?? this.hora,
      orden: orden ?? this.orden,
      observaciones: observaciones ?? this.observaciones,
      responsable: responsable ?? this.responsable,
    );
  }

  @override
  String toString() {
    return 'CreateCambioPosicionDto('
        'posicion: $posicion, '
        'hora: $hora, '
        'orden: $orden, '
        'observaciones: $observaciones, '
        'responsable: $responsable)';
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/features/registros_diarios/data/constants/strings.dart';
part 'registro_diario.freezed.dart';

@freezed
class RegistroDiario with _$RegistroDiario {
  const factory RegistroDiario({
    required String idRegistroDiario,
    required DateTime fechaRegistro,
    Firma? firmaNecesidades,
    // Firma? firmaX,
    // Firma? firmaY,
    // etc
  }) = _RegistroDiario;

  factory RegistroDiario.fromJson(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return RegistroDiario(
      idRegistroDiario: id,
      fechaRegistro: (json[Strings.fechaRegistro] as Timestamp).toDate(),
      firmaNecesidades: json[Strings.firmaNecesidades] != null
          ? Firma.fromJson(json[Strings.firmaNecesidades])
          : null, // Handle nullability
    );
  }
}

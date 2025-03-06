import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cateter.freezed.dart';
part 'cateter.g.dart';

@freezed
class Cateter with _$Cateter {
  const factory Cateter({
    required String id,
    required String tipo,
    required String sitio,
    required DateTime fechaInsercion, // ✅ Ahora es DateTime
    DateTime? fechaRetiro, // ✅ Ahora es DateTime opcional
    required String lugarProcedencia,
  }) = _Cateter;

  /// 🔥 **Conversión desde Firestore con manejo de nulos**
  factory Cateter.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {}; // ✅ Manejo seguro de datos nulos

    return Cateter(
      id: doc.id,
      tipo: data['tipo'] ?? 'Desconocido',
      sitio: data['sitio'] ?? 'No especificado',
      fechaInsercion: (data['fechaInsercion'] as Timestamp?)?.toDate() ??
          DateTime.now(), // ✅ Convierte Timestamp a DateTime
      fechaRetiro: (data['fechaRetiro'] as Timestamp?)
          ?.toDate(), // ✅ Manejo seguro de fecha opcional
      lugarProcedencia: data['lugarProcedencia'] ?? 'Desconocido',
    );
  }

  /// 🔥 **Conversión a JSON para Firestore**
  @override
  Map<String, dynamic> toJson() {
    return {
      "tipo": tipo,
      "sitio": sitio,
      "fechaInsercion":
          Timestamp.fromDate(fechaInsercion), // ✅ Guarda como Timestamp
      "fechaRetiro": fechaRetiro != null
          ? Timestamp.fromDate(fechaRetiro!)
          : null, // ✅ Manejo seguro
      "lugarProcedencia": lugarProcedencia,
    };
  }

  /// 🔥 **Conversión desde JSON**
  factory Cateter.fromJson(Map<String, dynamic> json) =>
      _$CateterFromJson(json);
}

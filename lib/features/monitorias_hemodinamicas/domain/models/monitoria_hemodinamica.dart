import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'monitoria_hemodinamica.freezed.dart';

@freezed
class MonitoriaHemodinamica with _$MonitoriaHemodinamica {
  const factory MonitoriaHemodinamica({
    required String idMonitoria,
    required int hora,
    required int orden,
    int? pas, // Presión arterial sistólica
    int? pad, // Presión arterial diastólica
    int? pam, // Presión arterial media (Fórmula: (2pad + 1pas)/3)
    int? fc, // Frecuencia cardiaca (ppm)
    int? fr, // Frecuencia respiratoria (rpm)
    double? t, // Temperatura (°C)
    int? pvc, // presion venosa central
    int? rvc, // Resistencia vascular sistemica
    int? fio2, // Fracción de Oxígeno Inspirado (%)
    int? pia, // Presión intraabdominal (mm H2O)
    int? ppa, // Presión de Perfusión arterial (mm Hg)
    int? pic, // Presión intracraneal (mm Hg)
    int? ppc, // Presión de Perfusión cerebral (mm Hg)
    int? glucometria, // Glucometría (mg/dL)
    int? insulina, // Insulina (Unidades)
    int? saturacion, // Saturación (%)
  }) = _MonitoriaHemodinamica;

  factory MonitoriaHemodinamica.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return MonitoriaHemodinamica(
      idMonitoria: id,
      hora: json['hora'] as int,
      orden: json['orden'] as int,
      pas: (json['pas'] as num?)?.toInt(),
      pad: (json['pad'] as num?)?.toInt(),
      pam: (json['pam'] as num?)?.toInt(),
      fc: json['fc'] as int?,
      fr: json['fr'] as int?,
      t: (json['t'] as num?)?.toDouble(),
      fio2: json['fio2'] as int?,
      pia: json['pia'] as int?,
      ppa: json['ppa'] as int?,
      pic: json['pic'] as int?,
      ppc: json['ppc'] as int?,
      glucometria: json['glucometria'] as int?,
      insulina: json['insulina'] as int?,
      saturacion: json['saturacion'] as int?,
    );
  }
}

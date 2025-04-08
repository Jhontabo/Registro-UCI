import "dart:collection";

import "package:registro_uci/features/monitoria_hemodinamica/data/constants/firebase_strings.dart";

class UpdateMonitoriaHemodinamicaDto extends MapView<String, dynamic> {
  final double? pas; // Presión arterial sistólica
  final double? pad; // Presión arterial diastólica
  final double? pam; // (2D + 1S) / 3
  final int? fc; // Frecuencia cardiaca
  final int? fr; // Frecuencia respiratoria
  final double? t; // Temperatura
  final int? fio2; // Fracción de Oxígeno Inspirado
  final int? pia; // Presión intraabdominal
  final int? ppa; // Presión de Perfusión arterial
  final int? pic; // Presión Intracraneal
  final int? ppc; // Presión de Perfusión cerebral
  final int? glucometria; // Glucometría
  final int? insulina; // Insulina
  final int? saturacion; // Saturación
  final DateTime? fechaFirma; // Fecha Firma
  final String? firmadoPor; // FirmadoPor

  UpdateMonitoriaHemodinamicaDto({
    this.pas,
    this.pad,
    this.pam,
    this.fc,
    this.fr,
    this.t,
    this.fio2,
    this.pia,
    this.ppa,
    this.pic,
    this.ppc,
    this.glucometria,
    this.insulina,
    this.saturacion,
    this.fechaFirma,
    this.firmadoPor,
  }) : super({
          if (pas != null) FirebaseStrings.pas: pas,
          if (pad != null) FirebaseStrings.pad: pad,
          if (pam != null) FirebaseStrings.pam: pam,
          if (fc != null) FirebaseStrings.fc: fc,
          if (fr != null) FirebaseStrings.fr: fr,
          if (t != null) FirebaseStrings.t: t,
          if (fio2 != null) FirebaseStrings.fio2: fio2,
          if (pia != null) FirebaseStrings.pia: pia,
          if (ppa != null) FirebaseStrings.ppa: ppa,
          if (pic != null) FirebaseStrings.pic: pic,
          if (ppc != null) FirebaseStrings.ppc: ppc,
          if (glucometria != null) FirebaseStrings.glucometria: glucometria,
          if (insulina != null) FirebaseStrings.insulina: insulina,
          if (saturacion != null) FirebaseStrings.saturacion: saturacion,
          if (fechaFirma != null) FirebaseStrings.fechaFirma: fechaFirma,
          if (firmadoPor != null) FirebaseStrings.firmadoPor: firmadoPor,
        });
}

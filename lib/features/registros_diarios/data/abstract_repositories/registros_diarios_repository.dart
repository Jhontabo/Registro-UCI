import 'package:registro_uci/features/firmas/data/dto/create_firma_dto.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/features/registros_diarios/data/dto/create_registro_diario_dto.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';

abstract class IRegistrosDiariosRepository {
  Future<List<RegistroDiario>> getRegistrosDiariosDeIngreso(String idIngreso);

  Future<RegistroDiario?> getRegistroDiario(
    String idIngreso,
    String idRegistro,
  );

  Future<void> addRegistroDiarioToIngreso(
    String idIngreso,
    CreateRegistroDiarioDto dto,
  );

  Future<void> firmarReporte(
    String idIngreso,
    String idRegistro,
    String tipoFirma,
    CreateFirmaDto firma,
  );

  Future<Firma?> getFirma(
    String idIngreso,
    String idRegistro,
    String tipoFirma,
  );

  Future<int> getBalanceAcumuladoUntilHora(
    String idIngreso,
    String idRegistroDiario,
    int hora,
  );
}

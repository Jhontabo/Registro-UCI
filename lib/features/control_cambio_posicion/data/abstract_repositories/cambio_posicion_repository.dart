import 'package:registro_uci/features/control_cambio_posicion/data/dto/create_cambio_posicion_dto.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

abstract class CambioPosicionRepository {
  // Métodos CRUD básicos
  Future<void> createCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    CreateCambioPosicionDto dto,
  );

  Future<void> updateCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    CreateCambioPosicionDto dto,
  );

  Future<void> deleteCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  );

  // Métodos de consulta
  Future<CambioDePosicion?> getCambioPosicionById(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  );

  Future<List<CambioDePosicion>> getCambiosDePosicion(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<List<CambioDePosicion>> getCambiosDePosicionFromPreviousHour(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<CambioDePosicion?> getUltimoCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
  );

  // Métodos adicionales útiles
  Future<Map<String, int>> getResumenPosiciones(
    String idIngreso,
    String idRegistroDiario,
  );
}

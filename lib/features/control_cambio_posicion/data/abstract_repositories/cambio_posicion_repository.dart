import 'package:registro_uci/features/control_cambio_posicion/data/dto/create_cambio_posicion_dto.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

abstract class CambioPosicionRepository {
  Future<List<CambioDePosicion>> getCambiosDePosicion(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<CambioDePosicion?> getCambioPosicionById(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  );

  Future<CambioDePosicion?> getUltimoCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> guardarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    int hora,
    String posicion,
  );

  Future<void> actualizarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    int hora,
    String posicion, {
    int? orden,
  });

  Future<void> eliminarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  );

  Future<Map<String, int>> getResumenPosiciones(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> reordenarCambiosPosicion(
    String idIngreso,
    String idRegistroDiario,
    List<String> idsEnOrden,
  );
}

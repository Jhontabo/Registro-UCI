import '../../domain/models/sonda.dart';

abstract class SondaRepository {
  /// Crea una nueva sonda dentro de un ingreso específico.
  /// [sonda] es el objeto de la sonda que se desea crear.
  /// [idIngreso] es el ID del ingreso asociado a la sonda.
  Future<void> createSonda(Sonda sonda, String idIngreso);

  /// Actualiza una sonda dentro de un ingreso específico.
  /// [sonda] es el objeto de la sonda que se desea actualizar.
  /// [idIngreso] es el ID del ingreso donde se encuentra la sonda.
  Future<void> updateSonda(Sonda sonda, String idIngreso);

  /// Elimina una sonda de un ingreso específico.
  /// [id] es el ID de la sonda a eliminar.
  /// [idIngreso] es el ID del ingreso donde se encuentra la sonda.
  Future<void> deleteSonda(String id, String idIngreso);

  /// Obtiene todas las sondas asociadas a un ingreso específico.
  /// [idIngreso] es el ID del ingreso cuyos registros de sondas se van a recuperar.
  Stream<List<Sonda>> getSondas(String idIngreso);
}

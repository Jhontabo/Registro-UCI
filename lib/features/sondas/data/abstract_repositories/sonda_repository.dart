import '../../domain/models/sonda.dart';

abstract class SondaRepository {
  /// ✅ Crea una nueva sonda dentro del ingreso correcto
  Future<void> createSonda(
      Sonda sonda, String idIngreso); // ✅ Se añade `idIngreso`

  /// ✅ Actualiza una sonda dentro del ingreso correcto
  Future<void> updateSonda(Sonda sonda, String idIngreso);

  /// ✅ Elimina una sonda de un ingreso específico
  Future<void> deleteSonda(String id, String idIngreso);

  /// ✅ Obtiene todas las sondas asociadas a un ingreso
  Stream<List<Sonda>> getSondas(String idIngreso);
}

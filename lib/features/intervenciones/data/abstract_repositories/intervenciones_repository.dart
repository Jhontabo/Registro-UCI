import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';

abstract class IntervencionesRepository {
  Future<List<Intervencion>> getIntervenciones();
  Future<List<Actividad>> getActividadesDeIntervencion(String idIntervencion);
}

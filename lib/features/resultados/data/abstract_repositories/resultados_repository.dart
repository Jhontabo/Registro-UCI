import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

abstract class ResultadosRepository {
  Future<List<Resultado>> getResultadosDeIntervencion(String idIntervencion);

  Future<List<Indicador>> getIndicadoresDeResultado(
    String idIntervencion,
    String idResultado,
  );
}

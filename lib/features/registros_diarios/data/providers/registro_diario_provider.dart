import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';

final registroDiarioProvider =
    FutureProvider.family<RegistroDiario?, ReporteParams>((ref, params) async {
  return await ref.watch(registrosDiariosRepositoryProvider).getRegistroDiario(
        params.idIngreso,
        params.idRegistro,
      );
});

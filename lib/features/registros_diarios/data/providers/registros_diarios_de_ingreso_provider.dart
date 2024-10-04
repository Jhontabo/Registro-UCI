import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';

final registrosDiariosDeIngresoProvider =
    FutureProvider.family<List<RegistroDiario>, String>((ref, idIngreso) async {
  return await ref
      .watch(registrosDiariosRepositoryProvider)
      .getRegistrosDiariosDeIngreso(idIngreso);
});

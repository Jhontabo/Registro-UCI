import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/data/dto/create_firma_dto.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/registros_diarios/data/abstract_repositories/registros_diarios_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registro_diario_provider.dart';

class FirmarReporteController extends AsyncNotifier<void> {
  late final IRegistrosDiariosRepository _repository =
      ref.watch(registrosDiariosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> firmarReporte(
    String idIngreso,
    String idRegistro,
    String tipoFirma,
    CreateFirmaDto firma,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        _repository.firmarReporte(idIngreso, idRegistro, tipoFirma, firma));
    // switch tipoFirma
    ref.invalidate(registroDiarioProvider(
        ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro)));
  }
}

final firmarReporteControllerProvider =
    AsyncNotifierProvider<FirmarReporteController, void>(
  () => FirmarReporteController(),
);

import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/necesidades/data/abstract_repositories/necesidades_repository.dart';
import 'package:registro_uci/features/necesidades/data/dto/create_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';

class AddNecesidadToRegistroController extends AsyncNotifier<void> {
  late final NecesidadesRepository _repository =
      ref.watch(necesidadesRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> addNecesidadToRegistro(
    String idIngreso,
    String idRegistro,
    CreateNecesidadDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.addNecesidadToRegistro(idIngreso, idRegistro, dto));
    ref.invalidate(
      necesidadesDeRegistroProvider(
        NecesidadesParams(idIngreso: idIngreso, idRegistro: idRegistro),
      ),
    );
  }
}

final addNecesidadToRegistroControllerProvider =
    AsyncNotifierProvider<AddNecesidadToRegistroController, void>(
  () => AddNecesidadToRegistroController(),
);

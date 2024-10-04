import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';

// Define the FutureProviderFamily to fetch an Ingreso by its ID
final ingresoByIdProvider =
    FutureProviderFamily<Ingreso?, String>((ref, idIngreso) async {
  final repository = ref.watch(ingresosRepositoryProvider);
  return await repository.getIngresoById(idIngreso);
});

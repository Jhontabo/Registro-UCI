import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';

final allIngresosProvider = FutureProvider<List<Ingreso>>((ref) async {
  return await ref.watch(ingresosRepositoryProvider).getAllIngresos();
});

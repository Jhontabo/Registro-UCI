import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/providers/cateter_provider.dart';
import '../../domain/models/cateter.dart';

/// 🔹 **Provider para obtener un catéter específico por ID**
final cateterByIdProvider =
    FutureProvider.family<Cateter?, ({String idIngreso, String idCateter})>(
        (ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  return await repository.getCateterById(params.idIngreso, params.idCateter);
});

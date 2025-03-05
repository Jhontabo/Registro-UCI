import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_cateter_repository.dart';
import '../../domain/models/cateter.dart';

/// ✅ Nombre del Provider corregido para que coincida
final cateteresRepositoryProvider =
    Provider<FirebaseCateterRepository>((ref) => FirebaseCateterRepository());

/// ✅ `getAllCateteres()` en lugar de `getAllCateteresStream()`
final allCateteresProvider = StreamProvider<List<Cateter>>((ref) {
  return ref.watch(cateteresRepositoryProvider).getAllCateteres();
});

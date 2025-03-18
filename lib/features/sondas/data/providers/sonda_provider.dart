import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_sonda_repository.dart';
import '../../domain/models/sonda.dart';

final sondaRepositoryProvider = Provider<FirebaseSondaRepository>((ref) {
  return FirebaseSondaRepository();
});

// ✅ `StreamProvider.family` corregido para recibir `idIngreso`
final sondasProvider =
    StreamProvider.family<List<Sonda>, String>((ref, idIngreso) {
  if (idIngreso.isEmpty) {
    return Stream.value([]); // ✅ Evita errores si `idIngreso` es vacío
  }

  final repository =
      ref.read(sondaRepositoryProvider); // ✅ Se usa `read` en lugar de `watch`
  return repository.getSondas(idIngreso);
});

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_sonda_repository.dart';
import '../../domain/models/sonda.dart';

final sondaRepositoryProvider = Provider<FirebaseSondaRepository>((ref) {
  return FirebaseSondaRepository();
});

// ✅ Usamos `StreamProvider.family` para recibir `idIngreso`
final sondasProvider =
    StreamProvider.family<List<Sonda>, String>((ref, idIngreso) {
  if (idIngreso.isEmpty) {
    return Stream.value([]); // ✅ Evita errores si `idIngreso` es vacío
  }

  final repository =
      ref.watch(sondaRepositoryProvider); // ✅ Usamos `watch` para suscripción
  return repository.getSondas(idIngreso);
});

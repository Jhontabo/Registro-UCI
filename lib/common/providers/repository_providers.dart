import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/users_repository.dart';
import 'package:registro_uci/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:registro_uci/features/auth/data/repositories/firebase_users_repository.dart';
import 'package:registro_uci/features/ingresos/data/abstract_repositories/ingresos_repository.dart';
import 'package:registro_uci/features/ingresos/data/repositories/firebase_ingresos_repository.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/abstract_repositories/monitorias_hemodinamicas_repository.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/repositories/firebase_monitorias_hemodinamicas_repository.dart';
import 'package:registro_uci/features/necesidades/data/abstract_repositories/necesidades_repository.dart';
import 'package:registro_uci/features/necesidades/data/repositories/firebase_necesidades_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/abstract_repositories/registros_diarios_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/repositories/firebase_registros_diarios_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return const FirebaseAuthRepository();
});

final usersRepositoryProvider = Provider<IUsersRepository>((ref) {
  return FirebaseUsersRepository();
});

final ingresosRepositoryProvider = Provider<IngresosRepository>((ref) {
  return FirebaseIngresosRepository();
});

final registrosDiariosRepositoryProvider =
    Provider<IRegistrosDiariosRepository>((ref) {
  return FirebaseRegistrosDiariosRepository();
});

final monitoriasHemodinamicasRepositoryProvider =
    Provider<IMonitoriasHemodinamicasRepository>((ref) {
  return FirebaseMonitoriasHemodinamicasRepository();
});

final necesidadesRepositoryProvider = Provider<NecesidadesRepository>((ref) {
  return FirebaseNecesidadesRepository();
});

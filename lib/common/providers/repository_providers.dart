import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dias_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dosis_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/tratamientos_antibioticos_repository.dart';
import 'package:registro_uci/features/antibioticos/data/repositories/firebase_dias_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/repositories/firebase_dosis_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/repositories/firebase_tratamientos_antibioticos_repository.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/users_repository.dart';
import 'package:registro_uci/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:registro_uci/features/auth/data/repositories/firebase_users_repository.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/data/abstract_repositories/liquidos_administrados_repository.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/data/repositories/firebase_liquidos_administrados_repository.dart';
import 'package:registro_uci/features/balance_liquidos/data/abstract_repositories/balances_de_liquidos_repository.dart';
import 'package:registro_uci/features/balance_liquidos/data/repositories/firebase_balances_de_liquidos_repository.dart';

import 'package:registro_uci/features/ingresos/data/abstract_repositories/ingresos_repository.dart';
import 'package:registro_uci/features/ingresos/data/repositories/firebase_ingresos_repository.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_repository.dart';
import 'package:registro_uci/features/intervenciones/data/repositories/firebase_intervenciones_repository.dart';
import 'package:registro_uci/features/intervenciones/data/repositories/hybrid_intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/abstract_repositories/monitorias_hemodinamicas_repository.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/repositories/firebase_monitorias_hemodinamicas_repository.dart';
import 'package:registro_uci/features/necesidades/data/abstract_repositories/necesidades_repository.dart';
import 'package:registro_uci/features/necesidades/data/repositories/firebase_necesidades_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/abstract_repositories/registros_diarios_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/repositories/firebase_registros_diarios_repository.dart';
import 'package:registro_uci/features/resultados/data/abstract_repositories/resultados_repository.dart';
import 'package:registro_uci/features/resultados/data/repositories/firebase_resultados_repository.dart';

import 'package:registro_uci/features/control_cambio_posicion/data/abstract_repositories/cambio_posicion_repository.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/repositories/firabase_cambio_posicion_repository.dart';
import 'package:registro_uci/features/control_sedacion/data/abstract_repositories/control_sedacion_repository.dart';
import 'package:registro_uci/features/control_sedacion/data/repositories/firebase_control_sedacion_repository.dart';

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

final intervencionesRepositoryProvider =
    Provider<IntervencionesRepository>((ref) {
  return FirebaseIntervencionesRepository();
});

final intervencionesDeRegistroRepositoryProvider =
    Provider<IntervencionesDeRegistroRepository>((ref) {
  return HybridIntervencionesDeRegistroRepository();
});

final resultadosProvider = Provider<ResultadosRepository>((ref) {
  return FirebaseResultadosRepository();
});

final tratamientosAntibioticosRepositoryProvider =
    Provider<TratamientosAntibioticosRepository>((ref) {
  return FirebaseTratamientosAntibioticosRepository();
});

final diasTratamientoRepositoryProvider =
    Provider<DiasTratamientoRepository>((ref) {
  return FirebaseDiasTratamientoRepository();
});

final dosisTratamientoRepositoryProvider =
    Provider<DosisTratamientoRepository>((ref) {
  return FirebaseDosisTratamientoRepository();
});

final balancesDeLiquidosRepositoryProvider =
    Provider<BalancesDeLiquidosRepository>((ref) {
  return FirebaseBalancesDeLiquidosRepository();
});

final liquidosAdministradosRepositoryProvider =
    Provider<LiquidosAdministradosRepository>((ref) {
  return FirebaseLiquidosAdministradosRepository();
});

final cambioPosicionRepositoryProvider =
    Provider<CambioPosicionRepository>((ref) {
  return FirebaseCambioPosicionRepository();
});

final controlSedacionRepositoryProvider =
    Provider<ControlSedacionRepository>((ref) {
  return FirebaseControlSedacionRepository();
});

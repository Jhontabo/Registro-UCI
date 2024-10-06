import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/auth/application/auth_service.dart';
import 'package:registro_uci/features/auth/data/dto/login_dto.dart';
import 'package:registro_uci/features/auth/presentation/state/auth_state.dart';

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthService _service = ref.watch(authServiceProvider);
  @override
  FutureOr<AuthState> build() async {
    // return AuthState(
    //   AuthResult.success,
    //   const User(
    //     id: '1',
    //     role: UserRole.nutritionist,
    //     name: 'Carlos Botina',
    //   ),
    // );
    return _service.getCurrentSession();
  }

  Future<void> login(LoginDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.login(dto),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.logout(),
    );
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(() => AuthController());

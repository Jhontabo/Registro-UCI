import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/users_repository.dart';
import 'package:registro_uci/features/auth/data/dto/login_dto.dart';
import 'package:registro_uci/features/auth/presentation/state/auth_state.dart';

class AuthService {
  final IAuthRepository _authRepository;
  final IUsersRepository _usersRepository;

  AuthService(
      {required IAuthRepository authRepository,
      required IUsersRepository usersRepository})
      : _authRepository = authRepository,
        _usersRepository = usersRepository;

  Future<AuthState> login(LoginDto dto) async {
    final AuthResult result = await _authRepository.login(dto);

    final String? userId = _authRepository.userId;

    if (result == AuthResult.success && userId != null) {
      final user = await _usersRepository.findUser(userId);

      if (user != null) {
        return AuthState(result, user);
      }
    }
    return AuthState(AuthResult.failure, null);
  }

  Future<AuthState> logout() async {
    await _authRepository.logout();
    return AuthState(AuthResult.logout, null);
  }

  Future<AuthState> getCurrentSession() async {
    final String? userId = _authRepository.userId;
    if (userId != null) {
      final user = await _usersRepository.findUser(userId);

      if (user != null) {
        return AuthState(AuthResult.success, user);
      }
    }
    return AuthState(AuthResult.logout, null);
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    usersRepository: ref.watch(usersRepositoryProvider),
  );
});

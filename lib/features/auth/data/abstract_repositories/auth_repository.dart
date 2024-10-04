import 'package:firebase_auth/firebase_auth.dart';
import 'package:registro_uci/features/auth/data/dto/login_dto.dart';
import 'package:registro_uci/features/auth/presentation/state/auth_state.dart';

abstract class IAuthRepository {
  String? get userId;
  String get displayName;
  Stream<User?> get authStateChanges;

  Future<void> logout();
  Future<AuthResult> login(LoginDto dto);
}

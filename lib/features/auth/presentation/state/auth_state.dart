import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/auth/domain/models/user.dart';
part 'auth_state.freezed.dart';

enum AuthResult {
  success,
  failure,
  logout,
}

@freezed
class AuthState with _$AuthState {
  factory AuthState(
    AuthResult authResult,
    User? user,
  ) = _AuthState;
}

import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:registro_uci/features/auth/data/dto/login_dto.dart';
import 'package:registro_uci/features/auth/presentation/state/auth_state.dart';

class FirebaseAuthRepository implements IAuthRepository {
  const FirebaseAuthRepository();

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  @override
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  @override
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<AuthResult> login(LoginDto dto) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: dto.email, password: dto.password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'user-not-found') {
        throw Exception('Correo no registrado');
      } else if (e.code == 'wrong-password') {
        throw Exception('Credenciales inválidas');
      } else if (e.code == 'invalid-credential') {
        throw Exception('Credenciales inválidas');
      } else if (e.code == 'invalid-email') {
        throw Exception('Correo no válido');
      }
    }

    return AuthResult.success;
  }
}

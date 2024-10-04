import 'package:registro_uci/features/auth/domain/models/user.dart';

abstract class IUsersRepository {
  Future<User?> findUser(String userId);
}

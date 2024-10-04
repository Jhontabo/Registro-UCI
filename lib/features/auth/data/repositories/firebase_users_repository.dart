import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/auth/data/abstract_repositories/users_repository.dart';
import 'package:registro_uci/features/auth/domain/constants/strings.dart';
import 'package:registro_uci/features/auth/domain/models/user.dart';

class FirebaseUsersRepository implements IUsersRepository {
  @override
  Future<User?> findUser(String userId) async {
    final user = await FirebaseFirestore.instance
        .collection(
          Strings.users,
        )
        .where(
          Strings.id,
          isEqualTo: userId,
        )
        .limit(1)
        .get();

    if (user.docs.isNotEmpty) {
      return User.fromJson(user.docs.first.data(), id: userId);
    } else {
      return null;
    }
  }
}

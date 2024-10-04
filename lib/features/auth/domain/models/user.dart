import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/auth/domain/constants/strings.dart';
import 'package:registro_uci/features/auth/domain/enums/user_role.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required UserRole role,
    required String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json, {required String id}) {
    return User(
      id: id,
      role: json[Strings.role].toString().toUserRole(),
      name: json[Strings.name],
    );
  }
}

import 'package:registro_uci/features/auth/domain/constants/strings.dart';

enum UserRole {
  admin,
  headNurse,
  auxNurse,
  nutritionist,
  doctor,
  guest,
}

extension ToUserRole on String {
  UserRole toUserRole() {
    switch (this) {
      case Strings.admin:
        return UserRole.admin;
      case Strings.headNurse:
        return UserRole.headNurse;
      case Strings.auxNurse:
        return UserRole.auxNurse;
      case Strings.nutritionist:
        return UserRole.nutritionist;
      case Strings.doctor:
        return UserRole.doctor;
      default:
        return UserRole.guest;
    }
  }
}

extension RoleToString on UserRole {
  String roleToString() {
    switch (this) {
      case UserRole.admin:
        return Strings.admin;
      case UserRole.headNurse:
        return Strings.headNurse;
      case UserRole.auxNurse:
        return Strings.auxNurse;
      case UserRole.nutritionist:
        return Strings.nutritionist;
      case UserRole.doctor:
        return Strings.doctor;
      case UserRole.guest:
        return Strings.guest;
    }
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/auth/domain/enums/user_role.dart';
import 'package:registro_uci/features/auth/presentation/controllers/auth_controller.dart';

final roleProvider = Provider<UserRole?>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) {
          return data.user?.role;
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
});

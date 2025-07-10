import 'package:smart_home_app/data/datasources/firebase_auth_datasource.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<UserEntity> loginWithEmail(String email, String password) {
    return remote.loginWithEmail(email, password);
  }
}

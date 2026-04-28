import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> login(String email, String password) async {
    final response = await remoteDataSource.login(email, password);
    final token = response['access_token'];
    await localDataSource.saveToken(token);
    return User.fromJson(response['user']);
  }

  @override
  Future<User> register(String name, String email, String password) async {
    final response = await remoteDataSource.register(name, email, password);
    final token = response['access_token'];
    await localDataSource.saveToken(token);
    return User.fromJson(response['user']);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    await localDataSource.clearToken();
  }

  @override
  Future<User?> getCurrentUser() async {
    final token = await localDataSource.getToken();
    if (token == null) return null;
    try {
      return await remoteDataSource.getUser();
    } catch (_) {
      await localDataSource.clearToken();
      return null;
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await localDataSource.getToken();
    return token != null;
  }
}

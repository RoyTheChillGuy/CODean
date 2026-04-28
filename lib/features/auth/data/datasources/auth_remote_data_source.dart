import 'package:dio/dio.dart';
import '../../domain/entities/user.dart';
import '../../../../core/api/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await apiClient.dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Login failed';
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    try {
      final response = await apiClient.dio.post('/register', data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      });
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Registration failed';
    }
  }

  Future<void> logout() async {
    try {
      await apiClient.dio.post('/logout');
    } on DioException {
      // Logic for failed logout can be added here
    }
  }

  Future<User> getUser() async {
    try {
      final response = await apiClient.dio.get('/user');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Failed to get user';
    }
  }
}

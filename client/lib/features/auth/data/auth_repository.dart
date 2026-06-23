import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../domain/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return User.fromJson({
        ...response.data['user'],
        'token': response.data['token'],
      });
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Login failed';
    }
  }

  Future<User> register(String name, String email, String password) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
      });
      return User.fromJson({
        ...response.data['user'],
        'token': response.data['token'],
      });
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Registration failed';
    }
  }
}

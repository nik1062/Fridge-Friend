import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../auth/presentation/auth_provider.dart';
import '../domain/inventory_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final authState = ref.watch(authProvider);
  
  String? token;
  if (authState is AuthAuthenticated) {
    token = authState.user.token;
  }
  
  return InventoryRepository(dio, token);
});

class InventoryRepository {
  final Dio _dio;
  final String? _token;

  InventoryRepository(this._dio, this._token);

  Options get _options => Options(
    headers: {
      if (_token != null) 'Authorization': 'Bearer $_token',
    },
  );

  Future<List<InventoryItem>> getItems() async {
    try {
      final response = await _dio.get('/inventory', options: _options);
      final List data = response.data['data'];
      return data.map((json) => InventoryItem.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Failed to fetch inventory';
    }
  }

  Future<InventoryItem> addItem(InventoryItem item) async {
    try {
      final response = await _dio.post(
        '/inventory',
        data: item.toJson(),
        options: _options,
      );
      return InventoryItem.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Failed to add item';
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _dio.delete('/inventory/$id', options: _options);
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'Failed to delete item';
    }
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/inventory_item.dart';
import '../data/inventory_repository.dart';

final inventoryProvider = FutureProvider<List<InventoryItem>>((ref) async {
  return ref.watch(inventoryRepositoryProvider).getItems();
});

class InventoryNotifier extends StateNotifier<AsyncValue<List<InventoryItem>>> {
  final InventoryRepository _repository;

  InventoryNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadItems();
  }

  Future<void> loadItems() async {
    state = const AsyncValue.loading();
    try {
      final items = await _repository.getItems();
      state = AsyncValue.data(items);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addItem(InventoryItem item) async {
    try {
      await _repository.addItem(item);
      loadItems(); // Refresh
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _repository.deleteItem(id);
      loadItems(); // Refresh
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final inventoryListProvider = StateNotifierProvider<InventoryNotifier, AsyncValue<List<InventoryItem>>>((ref) {
  return InventoryNotifier(ref.watch(inventoryRepositoryProvider));
});

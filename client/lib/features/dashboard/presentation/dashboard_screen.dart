import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../inventory/presentation/inventory_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBbrnsAyKm9sEo9dZpsKJxO1nXfY17KwsRsSWX5MqV0N2VJjfZzNz0qQKm7TmULePaF4uDu7X8eMj6UYIbIC71lRO_QfI1KaMcThHuRJ1K1bGe4XhCSEcsi49aT-IHiJ3Ri0NiuQk2d7gst6hNsU6wItPqbGesnRQxwHf0h-UhfR4V2zArwtz_2KJRGO-LBHWVA2apPEatPVFF8WgufPCerF7ig5lFc1LAHIlvBUuoBPzQD_0orlvQI_BVJEHcfIDpwvfZ87kotxnmh'),
          ),
        ),
        title: const Text('Fridge Friend'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF49672F)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Freshness Score Card
            _buildFreshnessCard(context),
            const SizedBox(height: 32),
            
            // Use It Now Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Use it Now', style: Theme.of(context).textTheme.titleLarge),
                const Text('EXPIRING SOON', style: TextStyle(color: Color(0xFF49672F), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              ],
            ),
            const SizedBox(height: 16),
            _buildExpiringList(inventoryState),
            
            const SizedBox(height: 32),
            // Recent Activity
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            _buildRecentActivity(inventoryState),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF49672F),
        shape: const CircleBorder(),
        child: const Icon(Icons.center_focus_strong, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildFreshnessCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4E1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('WEEKLY HEALTH', style: TextStyle(color: Color(0xFF49672F), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                const SizedBox(height: 8),
                Text('Freshness\nScore', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF49672F).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.savings_outlined, size: 16, color: Color(0xFF49672F)),
                      SizedBox(width: 4),
                      Text('Saved \$42.50 this week', style: TextStyle(color: Color(0xFF49672F), fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: 0.85,
                  strokeWidth: 10,
                  backgroundColor: Colors.white,
                  color: const Color(0xFF49672F),
                  strokeCap: StrokeCap.round,
                ),
              ),
              const Text('85%', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpiringList(AsyncValue<List> state) {
    return state.when(
      data: (items) {
        if (items.isEmpty) return const Text('No items expiring soon');
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length > 5 ? 5 : items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EEDB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.white,
                        child: item.imageUrl.isNotEmpty 
                          ? Image.network(item.imageUrl, fit: BoxFit.cover)
                          : const Icon(Icons.restaurant, color: Color(0xFF49672F)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE27A77).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.access_time, size: 10, color: Color(0xFF9A4341)),
                          const SizedBox(width: 4),
                          Text('${item.expiryDate.difference(DateTime.now()).inDays} Days', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF9A4341))),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Text('Error: $e'),
    );
  }

  Widget _buildRecentActivity(AsyncValue<List> state) {
    return state.when(
      data: (items) {
         return Column(
           children: [
             _buildActivityItem(Icons.add_circle, 'Added Organic Eggs', '2 hours ago • Fridge Main', '+\$6.50', const Color(0xFF49672F)),
             _buildActivityItem(Icons.restaurant, 'Used Greek Yogurt', 'Yesterday • Breakfast', 'Used', Colors.blueGrey),
             _buildActivityItem(Icons.delete, 'Expired Avocado', '2 days ago • Waste recorded', '-\$2.00', const Color(0xFF9A4341)),
           ],
         );
      },
      loading: () => const SizedBox(),
      error: (e, st) => const SizedBox(),
    );
  }

  Widget _buildActivityItem(IconData icon, String title, String subtitle, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      color: const Color(0xFFFEFAE7),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.dashboard, 'Dashboard', true),
          _buildNavItem(Icons.inventory_2_outlined, 'Inventory', false),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(Icons.restaurant_menu, 'Recipes', false),
          _buildNavItem(Icons.analytics_outlined, 'Analytics', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? const Color(0xFF49672F) : Colors.black45),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: active ? const Color(0xFF49672F) : Colors.black45)),
      ],
    );
  }
}

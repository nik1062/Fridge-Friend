import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListScreen extends HookWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quickAddController = useTextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF2EEDB),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF49672F), size: 18),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        title: Text(
          'Fridge Friend',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF49672F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined, color: Color(0xFF49672F)), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'YOUR WEEKLY PROVISIONS',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: const Color(0xFF49672F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Shopping List',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D1C11),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Auto-populated based on your 3 expiring items and ingredients for "Mushroom Risotto".',
                    style: TextStyle(fontSize: 14, color: Color(0xFF44483D), height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  // Produce Section
                  const _ListSection(
                    title: 'Produce',
                    count: 4,
                    items: [
                      _ShoppingItem(name: 'Organic Baby Spinach', subtitle: 'Replenishing: Expiring today', badge: 'CRITICAL', isCritical: true),
                      _ShoppingItem(name: 'Cremini Mushrooms', subtitle: 'For: Mushroom Risotto'),
                      _ShoppingItem(name: 'Shallots', subtitle: 'For: Mushroom Risotto'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Dairy & Chilled
                  const _ListSection(
                    title: 'Dairy & Chilled',
                    count: 2,
                    items: [
                      _ShoppingItem(name: 'Unsalted Butter', subtitle: 'Stock low: 15% remaining'),
                      _ShoppingItem(name: 'Greek Yogurt', subtitle: 'Replenishing: Out of stock', badge: 'RESTOCK'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Savings Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF49672F),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: const Color(0xFF49672F).withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 8)),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SMART SAVINGS', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                            const SizedBox(height: 8),
                            const Text('Save \$12.50 this week', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            const Text('By substituting Arborio for Barley already in your pantry.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF49672F), shape: const StadiumBorder()),
                              child: const Text('Swap Now', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const Positioned(
                          right: -20,
                          bottom: -20,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(Icons.savings, size: 100, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120), // Bottom padding for fixed quick add
                ],
              ),
            ),
          ),
          // Fixed Quick Add at bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E3D0),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: quickAddController,
                          decoration: const InputDecoration(
                            hintText: 'Quick add item...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton.small(
                      onPressed: () {},
                      backgroundColor: const Color(0xFF49672F),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListSection extends StatelessWidget {
  final String title;
  final int count;
  final List<_ShoppingItem> items;
  const _ListSection({required this.title, required this.count, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('$count ITEMS', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _ShoppingItem extends HookWidget {
  final String name;
  final String subtitle;
  final String? badge;
  final bool isCritical;

  const _ShoppingItem({required this.name, required this.subtitle, this.badge, this.isCritical = false});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Checkbox(
            value: isChecked.value,
            onChanged: (val) => isChecked.value = val!,
            activeColor: const Color(0xFF49672F),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, decoration: isChecked.value ? TextDecoration.lineThrough : null)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF44483D))),
              ],
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isCritical ? const Color(0xFFE27A77) : const Color(0xFFCAEEA7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badge!,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: isCritical ? const Color(0xFF400006) : const Color(0xFF1C3704),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

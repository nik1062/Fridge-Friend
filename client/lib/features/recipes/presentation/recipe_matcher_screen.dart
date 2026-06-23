import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipeMatcherScreen extends HookWidget {
  const RecipeMatcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilters = useState<Set<String>>({'Vegan'});
    final filters = ['Vegan', 'Under 30 mins', 'High Protein', 'Gluten Free', 'Keto', 'Dairy Free'];

    final recipes = [
      const Recipe(
        title: 'Summer Harvest Salad',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAhQR98pE2a432lzUeJjVIKjKLhPnJX-iEb84LsMerOQUFs0fRw2R1SjdWOtLzefjvOA2dqO2K1RHjvQRlMzkbwr790xGpBXSDxga4gtwZoWk2K_yZypBLqAp1xswBmeisE41z-rzUAoLje3G1NyQfIZefJrwSoIsS6bQnw1piSyLJRHADKeS7zueHzQwFHvirBIn6Nbhed_Jb8CTFPuNV8ryBKkn3hLtl4o3G-6qyeNrxWzrnaeEewM9XXV81jf0m-p4L88ZJ4vH16',
        matchCount: '4/5',
        time: '15 mins',
        isHighMatch: true,
      ),
      const Recipe(
        title: 'Rustic Lentil Soup',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDO1mSmRAYcmBR-cJ_xq4wPbBRFj5NldlzWyAhtzFqt_6FYePO5bBhgRJWk4ZpsI-teTrft5WEbSJu_7BWyLchv7wslZ_iHTNTYIX9fnu8jVaIGgtPm0AHJ62mow84nOzU_rd4YIv83uuAnNmaQXRVS1GgiPXaNc1dIAdzLgy0_BmeY4vXQxVgCMJHTa-5tGNc5yJulSThExZ9LR6AXqM1-dwJCp1t5z2dPIQp9bqJi92z1YH_Hxg_U2ugKUhrllOMbsTjo5_v73hqI',
        matchCount: '3/6',
        time: '40 mins',
        isHighMatch: false,
      ),
      const Recipe(
        title: 'Basil Pesto Penne',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD7W5-w6hln0_fOjrKqPZY7Ah7mbzvmMMZIAYh4fCmf4j3ZBF16wdUhZrgfeWiDXE3CDLu1dCgusSreshpgxws5Qr2BpsGqqDInCe4v3-ymzggK4pSy_Y6d1BIR5ZZFTlk_zmihwCKgeSVeEm4y0xoFqbAGjUF01Vf-bnz-83aUDpaoqFCs6jH8b6RrNV5nZXYldQ5_p9xmxvHjY4ywLoPPZgP3cD9AXpk8GUypYJ9Yc-hKJVkwkBhim4Pv3zzv94J0UOxZa_fFP5lL',
        matchCount: '5/5',
        time: '20 mins',
        isHighMatch: true,
      ),
      const Recipe(
        title: 'Nourish Grain Bowl',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBQQ-UkIgO2pUGVOLk1mQhnKpb3rsqgLf6rQ5BxEfTWyTY5ajnWahokqRyncQCakd0W1gfYg4xc1IIb7kuQIkvNrapEkiYBro4xhe81w6I6DXWBCcVkONtMwKa1iy7O1Zj5fQo3F3xsrmbQfKqLBShsgHMnciCci-gtNj6EMZfOHuFE7bYQD5I-na6eOg04Jx7y-U4M5XdZdNucbIwe5gZ9CXLaFBg1ZgcyyWfUs0Y2WhBsIwlE2UQf20z4Tfn6dGG2_XZZHjT9EhlF',
        matchCount: '4/7',
        time: '25 mins',
        isHighMatch: true,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFCAEEA7),
            child: ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuASrNhbXgdHQR-jHzgHXVwX4lUI7LdnTtou7kEoXdYOesvwfFXmWrQt9tj64U-efBs8uOjXwdNSh7vQR3m2XAjNNr41I-Mfu2983IkhWz9RAFTGGwbAU-PsVrSTgMcOHMj3GI3hjQEE-RoGiYD-cCKc9AQ1J6m_q52URlz0GT556lb8s9KP3r58zRHLiHJxi_vf-g9Y9B6lA6H-Vg2cxh0XSCD5Nc3zJYbJp7d2OG5Mb0yTGsmrNuEAcMvYTOzZX6BCMo5aCd6Z4_Hs',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          'Fridge Friend',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF49672F),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF49672F)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                "What's for dinner?",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1D1C11),
                ),
              ),
              const SizedBox(height: 24),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF44483D)),
                  hintText: 'Search your ingredients...',
                  hintStyle: TextStyle(color: const Color(0xFF44483D).withOpacity(0.6)),
                  filled: true,
                  fillColor: const Color(0xFFF2EEDB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Filters
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    final isSelected = selectedFilters.value.contains(filter);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (val) {
                          final newFilters = Set<String>.from(selectedFilters.value);
                          if (val) {
                            newFilters.add(filter);
                          } else {
                            newFilters.remove(filter);
                          }
                          selectedFilters.value = newFilters;
                        },
                        selectedColor: const Color(0xFF49672F),
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF44483D),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        backgroundColor: const Color(0xFFF2EEDB),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              // Recipe Grid
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return GestureDetector(
                    onTap: () => context.push('/recipe-detail'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F4E1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                                child: Image.network(recipe.image, fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: (recipe.isHighMatch ? const Color(0xFF49672F) : const Color(0xFFE27A77)).withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        recipe.isHighMatch ? Icons.check_circle : Icons.warning,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${recipe.matchCount} MATCHED',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.title,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.schedule, size: 12, color: Color(0xFF44483D)),
                                    const SizedBox(width: 4),
                                    Text(
                                      recipe.time,
                                      style: const TextStyle(fontSize: 10, color: Color(0xFF44483D)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF49672F),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class Recipe {
  final String title;
  final String image;
  final String matchCount;
  final String time;
  final bool isHighMatch;

  const Recipe({
    required this.title,
    required this.image,
    required this.matchCount,
    required this.time,
    required this.isHighMatch,
  });
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFFEFAE7).withOpacity(0.7),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIcon(icon: Icons.dashboard_outlined, label: 'Dashboard', onTap: () => context.go('/')),
            _NavIcon(icon: Icons.inventory_2_outlined, label: 'Inventory', onTap: () => context.go('/inventory')),
            const SizedBox(width: 48), // Space for FAB
            _NavIcon(icon: Icons.restaurant_menu, label: 'Recipes', isSelected: true, onTap: () {}),
            _NavIcon(icon: Icons.analytics_outlined, label: 'Analytics', onTap: () => context.go('/analytics')),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.label, this.isSelected = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF49672F) : const Color(0xFF44483D);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

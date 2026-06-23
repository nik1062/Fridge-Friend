import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailScreen extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final int daysLeft;

  const ItemDetailScreen({
    super.key,
    this.itemName = 'Organic Strawberries',
    this.itemImage = 'https://lh3.googleusercontent.com/aida-public/AB6AXuDv2juVjYJ6yLtq3HRixymb1u9mVnpTXCWndIhvUEuj4SeWba30IDxcvfDVGaABiPnJvke2gMaNK7vObpz2JMsyBOJTNnU1zcpWpjp19XVHSLhVuxE6DXuts69dIXiLsIoOEaUrkqET6CrBXxTjo__zw2uUy7WyiYwMPQWl0ApszssGy56fSWkLqnwybBAFGUcdVbZ88LkNF6b9qBG8FDdmnhQ337CeiAEZNo_sNxZpxXIyxgAOejia-mIPys1MKNLnMdRg-BjH7K2i',
    this.daysLeft = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF2EEDB),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF49672F), size: 18),
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
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2EEDB),
              child: Icon(Icons.edit, color: Color(0xFF49672F), size: 18),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2EEDB),
              child: Icon(Icons.delete, color: Color(0xFFBA1A1A), size: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Image with Expiry Badge
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          itemImage,
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -16,
                        right: -16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE27A77),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                daysLeft.toString().padLeft(2, '0'),
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF400006),
                                ),
                              ),
                              Text(
                                'Days Left',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: const Color(0xFF400006),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Title and Category
                  Text(
                    'Fresh Produce',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: const Color(0xFF49672F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    itemName,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D1C11),
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Quantity Controller
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EEDB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'STOCK LEVEL',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF44483D),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '450',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF49672F),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'grams',
                                      style: TextStyle(fontSize: 14, color: Color(0xFF44483D)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7E3D0),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: const Icon(Icons.remove, color: Color(0xFF49672F)),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '3',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFF49672F),
                                    child: IconButton(
                                      icon: const Icon(Icons.add, color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today, size: 16),
                                label: const Text('MEAL PLAN'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE7E3D0),
                                  foregroundColor: const Color(0xFF49672F),
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.history, size: 16),
                                label: const Text('LOG USAGE'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF49672F).withOpacity(0.1),
                                  foregroundColor: const Color(0xFF49672F),
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Nutritional Facts
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F4E1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nutritional Facts',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2EEDB),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Per 100g',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _NutrientInfo(label: 'Calories', value: '32'),
                            _NutrientInfo(label: 'Carbs', value: '7.7g'),
                            _NutrientInfo(label: 'Fiber', value: '2.0g'),
                            _NutrientInfo(label: 'Protein', value: '0.7g'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFFC4C8BA)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quality Decay',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const Text(
                              'Critical State',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF9A4341),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: 0.85,
                            minHeight: 12,
                            backgroundColor: const Color(0xFFE7E3D0),
                            color: const Color(0xFFE27A77),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Storage Tips
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EEDB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Storage Tips',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _StorageTip(
                          icon: Icons.thermostat,
                          title: 'Keep Chilled',
                          description: 'Best kept at 2-4°C in the crisper drawer.',
                        ),
                        _StorageTip(
                          icon: Icons.water_drop,
                          title: "Don't Wash Yet",
                          description: 'Only wash right before eating to avoid mold.',
                        ),
                        _StorageTip(
                          icon: Icons.layers,
                          title: 'Breathable Paper',
                          description: 'Line your container with paper towels.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Recipe Suggestions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Use them up',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'VIEW ALL RECIPES',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: const Color(0xFF49672F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        _RecipeCard(
                          image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBWOnDvnEk0Ekq6tNRAEdSFF-3BvkSfQEqg4QGITJZHmXPHe3754l53rwTEpAPPl7BkybY8oLNJ6woungUnqkIgiTQdvmYFObtvciaDEGDP_x2ZlgHIHia8u2Y-oRcKaQ3lRwCoLbLVXwjDCGSoG_iDs4NntMsLXJ_w8K293nlUR9cFqbKuJjBy2EMm-LBOCJDSqar6jfxKRwFTcSIZZYTshT7xfzp2IzimUDvGIW43I-gPKsosWZLAcPz7wUISPs_yARVUaVWnTbyN',
                          tag: 'Lunch',
                          title: 'Summer Berry Salad',
                          time: '12 min',
                          difficulty: 'Easy',
                        ),
                        SizedBox(width: 16),
                        _RecipeCard(
                          image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCjyrmI5pspnFZi5ZK309WTy-SqxOyBkLRJIIqeEWoffIzKLlAg2Dvt-RdBQY7HHY6RncUJ12MaJ6Wu2ofq9umJ61llueA2XMBvogqUf9GinA17g9JkMPNHvOZmlE6HjFP4idMtXNWXJTCbXqvaGgAGtiKse-D7rE6wWSomks7UwuaYjLISBFINPoj_X4ZBlFRkSVzV2EG4u_gNC2zzJXLGyO35gU0_k-jE_WRQJP4p1krXRNY5dpw5YLrc5g1VwfCIaM1C3Z-3TSv3',
                          tag: 'Breakfast',
                          title: 'Protein Berry Bliss',
                          time: '5 min',
                          difficulty: 'Quick',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: Color(0xFF49672F)),
                    SizedBox(width: 8),
                    Text(
                      'Active Inventory',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF49672F),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Move to Freezer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NutrientInfo extends StatelessWidget {
  final String label;
  final String value;
  const _NutrientInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF49672F),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF44483D)),
        ),
      ],
    );
  }
}

class _StorageTip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _StorageTip({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF81A263)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF44483D)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final String image;
  final String tag;
  final String title;
  final String time;
  final String difficulty;

  const _RecipeCard({
    required this.image,
    required this.tag,
    required this.title,
    required this.time,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
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
            child: Image.network(image, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            tag.toUpperCase(),
            style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: Color(0xFF81A263),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.schedule, size: 12, color: Color(0xFF44483D)),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(fontSize: 10)),
              const SizedBox(width: 12),
              const Icon(Icons.bolt, size: 12, color: Color(0xFF44483D)),
              const SizedBox(width: 4),
              Text(difficulty, style: const TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

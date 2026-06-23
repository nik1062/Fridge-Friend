import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

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
              icon: const Icon(Icons.arrow_back, color: Color(0xFF49672F), size: 18),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2EEDB),
              child: Icon(Icons.favorite, color: Color(0xFF44483D), size: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Image
            Stack(
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAjxBn7UTmPWYo0jWLR6U581fQEXt2RAVWrRNKf7vLYH6mo76CY2ovuF2VIVQSrhNK61NJrQETLv3jOxFRd8berGsCZ0I_RRVhwUbR7ZDps4qYTWLL_bPfvkc-GssVBKuD8Z265Io8kc2pgEPAz3bF3sjhmPTRRR0OAvo9lW8z0MUlBUldMOgt78hXPc6jC6wsxZGeTwxfCQ_xzjZon8PgoMUewswoPHZQ66hfL6BAfGT37A4zF_a6LOVjtbo2hn8xz-m9xcVj2Qom8',
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _Badge(text: 'HIGH FIBER', color: const Color(0xFFCAEEA7), textColor: const Color(0xFF1C3704)),
                      const SizedBox(width: 8),
                      _Badge(text: '15 MIN', color: const Color(0xFFE7E3D0), textColor: const Color(0xFF44483D)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Garden Harvest Buddha Bowl',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF49672F),
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFF49672F), size: 16),
                      const SizedBox(width: 4),
                      const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text('124 reviews', style: TextStyle(color: const Color(0xFF44483D).withOpacity(0.6))),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Nutritional Stats
                  Row(
                    children: [
                      _StatCard(label: 'Calories', value: '420 kcal', color: const Color(0xFFF8F4E1)),
                      const SizedBox(width: 8),
                      _StatCard(label: 'Carbs', value: '52 g', color: const Color(0xFFF2EEDB)),
                      const SizedBox(width: 8),
                      _StatCard(label: 'Protein', value: '14 g', color: const Color(0xFFE7E3D0)),
                      const SizedBox(width: 8),
                      _StatCard(label: 'Fat', value: '18 g', color: const Color(0xFFF8F4E1)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Ingredients
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingredients',
                        style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F4E1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('2 Servings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _IngredientItem(name: 'Fresh Kale', amount: '2 bunches', isInFridge: true),
                  const _IngredientItem(name: 'Cherry Tomatoes', amount: '1 cup', isInFridge: true),
                  const _IngredientItem(name: 'Avocado', amount: '1 large ripe', isInFridge: false),
                  const _IngredientItem(name: 'Chickpeas', amount: '1 can (15oz)', isInFridge: true),
                  const _IngredientItem(name: 'Tahini Dressing', amount: '2 tbsp', isInFridge: false),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_basket),
                      label: const Text('Add Missing to List'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF49672F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Preparation
                  Text(
                    'Preparation',
                    style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const _PrepStep(
                    number: 1,
                    title: 'Prepare the Grains',
                    description: 'Rinse the quinoa thoroughly under cold water. In a medium pot, combine quinoa and water. Bring to a boil, then cover, reduce heat to low, and simmer for 15 minutes.',
                    timer: '15:00',
                  ),
                  const _PrepStep(
                    number: 2,
                    title: 'Roast the Chickpeas',
                    description: 'Toss chickpeas with olive oil, smoked paprika, and a pinch of salt. Spread on a baking sheet and roast at 400°F (200°C) until golden and crispy.',
                    timer: '20:00',
                  ),
                  const _PrepStep(
                    number: 3,
                    title: 'Massage the Kale',
                    description: 'Remove stems from kale and tear into bite-sized pieces. Drizzle with a little olive oil and a pinch of salt. Use your hands to massage the kale until it softens.',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const _Badge({required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF44483D))),
            Text(
              value.split(' ')[0],
              style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF49672F)),
            ),
            Text(value.split(' ').length > 1 ? value.split(' ')[1] : '', style: const TextStyle(fontSize: 10, color: Color(0xFF44483D))),
          ],
        ),
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final String name;
  final String amount;
  final bool isInFridge;

  const _IngredientItem({required this.name, required this.amount, required this.isInFridge});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4E1),
        borderRadius: BorderRadius.circular(12),
        border: isInFridge ? null : Border.all(color: const Color(0xFFE27A77).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            isInFridge ? Icons.check_circle : Icons.shopping_cart,
            color: isInFridge ? const Color(0xFF49672F) : const Color(0xFF9A4341),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(amount, style: const TextStyle(fontSize: 12, color: Color(0xFF44483D))),
              ],
            ),
          ),
          Text(
            isInFridge ? 'IN FRIDGE' : 'MISSING',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: isInFridge ? const Color(0xFF49672F) : const Color(0xFF9A4341),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrepStep extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String? timer;

  const _PrepStep({required this.number, required this.title, required this.description, this.timer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFF49672F),
            child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(color: Color(0xFF44483D), height: 1.5)),
                if (timer != null) ...[
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.timer, size: 16),
                    label: Text('Start Timer: $timer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2EEDB),
                      foregroundColor: const Color(0xFF49672F),
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

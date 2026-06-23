import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDFVe8ex2-JmS_JoXvtq3Zc7Clju83racQ2PjOxmZ2-8I2lTxLjuKU6POPZYxWuNlMzWbkpywiwVy6mZPYB5MSFQwpw6rCmr6qnCbUu4AqkCLbwpnZMzVSg_9v4BzBnCqKmxCFdVHr2t9VLTQmbculcEPCg-9WzIbFR8NJ2EYhFlBxcoOvXMj9sWwRg37B21AdPqLsf1AU_cOi235RBdf-IRiW64JixUX6_prPnm7SdlcfYcWhDwMt2J4aqs1d4MezTwfPEVEHq2aLw',
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
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Color(0xFF44483D)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_outlined, color: Color(0xFF49672F)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WEEKLY CURATION',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: const Color(0xFF49672F),
                        ),
                      ),
                      Text(
                        'Meal Planner',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D1C11),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EEDB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Oct 23 - 29',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Expiry Alert
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDAD7).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFF9A4341), size: 16),
                        SizedBox(width: 8),
                        Text(
                          'USE IT OR LOSE IT',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9A4341),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Color(0xFF1D1C11), height: 1.5, fontSize: 14),
                        children: [
                          const TextSpan(text: 'Your '),
                          TextSpan(
                            text: 'Organic Spinach',
                            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Greek Yogurt',
                            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          ),
                          const TextSpan(text: ' expire in 48 hours.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.push('/recipes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5E1518),
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('FIND RECIPES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Daily Planner (Horizontal Scroll for Days)
              SizedBox(
                height: 450,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _DayColumn(day: 'Mon', date: '23', meals: [
                      _MealSlot(type: 'Breakfast', name: 'Berry Smoothie Bowl'),
                      _MealSlot(type: 'Lunch', name: 'Garden Chicken Salad', isExpiring: true),
                      _MealSlot(type: 'Dinner', isPlaceholder: true),
                    ]),
                    SizedBox(width: 16),
                    _DayColumn(day: 'Tue', date: '24', meals: [
                      _MealSlot(type: 'Breakfast', name: 'Overnight Oats'),
                      _MealSlot(type: 'Lunch', isPlaceholder: true),
                      _MealSlot(type: 'Dinner', name: 'Grilled Salmon & Asparagus'),
                    ]),
                    SizedBox(width: 16),
                    _DayColumn(day: 'Wed', date: '25', meals: [
                      _MealSlot(type: 'Breakfast', isPlaceholder: true),
                      _MealSlot(type: 'Lunch', isPlaceholder: true),
                      _MealSlot(type: 'Dinner', isPlaceholder: true),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Quick Drag
              Text(
                'Quick Drag',
                style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const _QuickDragCard(
                title: 'Quinoa Power Bowl',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDUdYn2AyMYjPaFiBnDoxpamGyBpfTrGHfPq9bOeH8yAzAdBKgsGwjJX3dCV424BzzQDakdD0Xn6hUH7pQuU-RSWg6ryuPBT6fKn2twRPfOH5cs93-BYYmT9_X4-Ujk0QTwtw-v6rWVdKhfb_DrLDHeCmfp23QgxkTn-3pSnJ3czBLDGJi2Myf60fPUfC3hM62fHCVVW358j0AT9FvPiH1bCZ2tGuyrZX7OJyHrsff6RaYrhch0XjrZ6lEL_xpfG3A7Tc69tEbAAKV6',
                impact: 'Uses 4 expiring items',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _DayColumn extends StatelessWidget {
  final String day;
  final String date;
  final List<Widget> meals;
  const _DayColumn({required this.day, required this.date, required this.meals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Text(day.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF44483D))),
          Text(date, style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF49672F))),
          const SizedBox(height: 16),
          ...meals,
        ],
      ),
    );
  }
}

class _MealSlot extends StatelessWidget {
  final String type;
  final String? name;
  final bool isPlaceholder;
  final bool isExpiring;

  const _MealSlot({required this.type, this.name, this.isPlaceholder = false, this.isExpiring = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isPlaceholder ? Colors.transparent : const Color(0xFFF2EEDB),
        borderRadius: BorderRadius.circular(12),
        border: isPlaceholder ? Border.all(color: const Color(0xFFC4C8BA).withOpacity(0.5), width: 2, style: BorderStyle.none) : null,
      ),
      child: isPlaceholder
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_circle, color: Color(0xFFC4C8BA)),
                  const SizedBox(height: 4),
                  Text('Add $type', style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFFC4C8BA))),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(type.toUpperCase(), style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF74796C))),
                    if (isExpiring) const Icon(Icons.circle, color: Color(0xFFBA1A1A), size: 6),
                  ],
                ),
                const Spacer(),
                Text(name!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.2)),
                if (isExpiring) const Text('Expires Today', style: TextStyle(fontSize: 8, color: Color(0xFFBA1A1A), fontWeight: FontWeight.bold)),
              ],
            ),
    );
  }
}

class _QuickDragCard extends StatelessWidget {
  final String title;
  final String image;
  final String impact;

  const _QuickDragCard({required this.title, required this.image, required this.impact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(image, width: 64, height: 64, fit: BoxFit.cover)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.eco, size: 12, color: Color(0xFF49672F)),
                    const SizedBox(width: 4),
                    Text(impact, style: const TextStyle(fontSize: 10, color: Color(0xFF49672F), fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

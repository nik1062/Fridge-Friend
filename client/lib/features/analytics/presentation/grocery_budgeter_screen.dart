import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryBudgeterScreen extends StatelessWidget {
  const GroceryBudgeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF49672F)),
          onPressed: () {},
        ),
        title: Text(
          'Digital Larder',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF49672F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFE7E3D0),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAWuVbjz6KCi0tpn9OOCBcXDjisI2YTQvbfeUzRcJSwRMRB5A5ogdt0K0ywtQVb67_Lav5hyZ-NwSCqp5Mr2YQgTMMbYNTR-WZ3_IbTJ4p9lvvO2AS2AdP26-TjAlJVo9xOg42ur0aBS40w1GbyYwQrmzwiiFXjlzMDEnHkBydftDLiMKlY4tVtUSi-qxn1RkrVmp_SCUoJzThkiUj-7FIf7rk1JC6io2FgTcjQNBz0UBYYFIrSG3BvyKbHsq19zjtDnUWDXs8qSKY-',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MONTHLY OVERVIEW',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '\$412',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D1C11),
                    ),
                  ),
                  Text(
                    '.50',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFC4C8BA),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Spent this month', style: TextStyle(color: Color(0xFF44483D))),
                  const Text('82% of budget', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const LinearProgressIndicator(
                  value: 0.82,
                  minHeight: 12,
                  backgroundColor: Color(0xFFECE8D6),
                  color: Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$0', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('\$500 GOAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 32),
              // Smart Insight Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2EEDB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border(left: BorderSide(color: Color(0xFF49672F), width: 4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Smart Insight', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Color(0xFF44483D), height: 1.5),
                        children: [
                          TextSpan(text: "You've saved "),
                          TextSpan(text: '\$42.00', style: TextStyle(color: Color(0xFF49672F), fontWeight: FontWeight.bold)),
                          TextSpan(text: ' this month by switching to '),
                          TextSpan(text: 'local seasonal greens', style: TextStyle(fontStyle: FontStyle.italic, decoration: TextDecoration.underline)),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Spending Trends Chart Mockup
              Text('Spending Trends', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Container(
                height: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _Bar(height: 0.4),
                    _Bar(height: 0.6),
                    _Bar(height: 0.85, isHighlighted: true),
                    _Bar(height: 0.55),
                    _Bar(height: 0.7),
                    _Bar(height: 0.45),
                    _Bar(height: 0.3),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Category Breakdown
              Text('By Category', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              const _CategoryRow(icon: Icons.eco, label: 'Produce', amount: '\$124', progress: 0.45, color: Color(0xFF49672F)),
              const _CategoryRow(icon: Icons.egg, label: 'Dairy & Eggs', amount: '\$88', progress: 0.30, color: Color(0xFF4F616B)),
              const _CategoryRow(icon: Icons.bakery_dining, label: 'Pantry', amount: '\$156', progress: 0.60, color: Color(0xFF9A4341)),
              const SizedBox(height: 40),
              // Market Watch
              Text(
                'MARKET WATCH',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              Text('Best Value Near You', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              const _MarketCard(
                name: 'The Green Grocer',
                distance: '0.4 miles away',
                savings: '-15%',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCkI3bUifw_YLEme4_-6HPVYFnP74GXxDu9FPHNx3TpCIZ58Lg6fMdhzxHomRAZ0J-vgiCAgOq_e3N8imh4mSdeopK4wKfIcgV83CTfvODskSQgMmBo3XQ3Fw0OKifI8XH9zAcIKp8eFwYSug8oD5yCeoFmmaWf95_HXJk0exYa5cXWrI3THWIkDtYFWVNeD9elezzl2ouFAP7ocZc0VttDflhpwlEbCc6jagweR54906TYSs04zPKL13yL_fgMjrb0Vb7olzaAqevZ',
                tag: 'Top Pick',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final bool isHighlighted;
  const _Bar({required this.height, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 150 * height,
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF49672F) : const Color(0xFFE7E3D0),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  final double progress;
  final Color color;

  const _CategoryRow({required this.icon, required this.label, required this.amount, required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(value: progress, minHeight: 4, backgroundColor: color.withOpacity(0.1), color: color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketCard extends StatelessWidget {
  final String name;
  final String distance;
  final String savings;
  final String image;
  final String tag;

  const _MarketCard({required this.name, required this.distance, required this.savings, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(16)),
      overflow: hidden,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(image, height: 160, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFF49672F), borderRadius: BorderRadius.circular(20)),
                  child: Text(tag, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(distance, style: const TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(savings, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
                    const Text('AVG PRICE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
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

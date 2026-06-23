import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class StorageGuideScreen extends StatelessWidget {
  const StorageGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF49672F)),
          onPressed: () => context.pop(),
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
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF44483D)),
            onPressed: () {},
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
                'CURATION GUIDE',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The Art of Freshness',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1D1C11),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Optimize your larder with expert storage insights designed to prolong life and preserve flavor.',
                style: TextStyle(fontSize: 16, color: Color(0xFF44483D), height: 1.5),
              ),
              const SizedBox(height: 40),
              // Fruit Library (Featured Card)
              _GuideCard(
                title: 'Fruit Library',
                icon: Icons.spa,
                color: const Color(0xFFF8F4E1),
                isFeatured: true,
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCt1Wc0cmD5sDcc9cBNopuU7Dd26K6Mktj40lbjVF9t2AfFw8awDBvVZ-wYjm_UHBdBqYOJn8btvk4P1ITYKwwG0pbqrgQyJjWQJdGuCqE2q6aBkw0dVusvkwwH4lVXg_-X68arRB901g-JBbxCQd7sxAqhmsUwPsJp5kpDyjogTjQ8Tiz-Ig40qjANJt5V1MX2Nh2pgof2A0f8vViEYy0hE5Vi2bzHeUFCen7oFP9M3z9PsyEcFVkAS1P24oR6VZfOyJTi0tAtI8-5',
                details: const [
                  _GuideDetail(label: 'BEST TEMPERATURE', value: '4°C to 10°C'),
                  _GuideDetail(label: 'SHELF PLACEMENT', value: 'Crisper Drawer (Low Humidity)'),
                ],
                description: 'Keep apples and bananas away from greens to prevent premature wilting.',
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _GuideCard(
                      title: 'Proteins',
                      icon: Icons.restaurant,
                      color: const Color(0xFFF2EEDB),
                      details: const [
                        _GuideDetail(label: 'BEST TEMP', value: '0°C to 2°C'),
                        _GuideDetail(label: 'PLACEMENT', value: 'Bottom Shelf'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _GuideCard(
                      title: 'Vegetables',
                      icon: Icons.eco,
                      color: const Color(0xFFE7E3D0),
                      details: const [
                        _GuideDetail(label: 'TEMP', value: '4°C'),
                        _GuideDetail(label: 'PLACEMENT', value: 'Crisper (High)'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _GuideCard(
                title: 'Dairy & Eggs',
                icon: Icons.egg,
                color: const Color(0xFFF8F4E1),
                details: const [
                  _GuideDetail(label: 'TEMP', value: '2°C - 4°C'),
                  _GuideDetail(label: 'PLACEMENT', value: 'Back of Middle Shelf'),
                ],
                description: 'Pro Tip: Avoid the door. Temperature fluctuations here are too high for milk and eggs.',
              ),
              const SizedBox(height: 24),
              // Preservation Recipes Guide
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCwQPdw0oWrMcYQK3NOeFLxEly3C8IW9MoOasY3wEF_G53YCkeZnyTpv453coPIhK7Cshkuf3KyySwiEL3CJwoZ38MiNJZXpYSZG425eRBfvarGrHQIxstlsLPRzPqgq5BG3FbCgGBD9E2jhWAUdAvvDiU2so4lXg9ir2Cr3yI_82UHwW_TL1F6l1TXbxBdJC1tSudAF82zOtJbnpjV0p1nLeSArLv7yjFfzGADBoCMKLZuzXxJpp_ZCOC16rPRh9xhKtEllxU1w6Gp',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Preservation Recipes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Learn how to pickle and ferment your surplus stock to extend shelf life by months.',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF49672F),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          child: const Text('EXPLORE GUIDE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isFeatured;
  final String? image;
  final List<_GuideDetail> details;
  final String? description;

  const _GuideCard({
    required this.title,
    required this.icon,
    required this.color,
    this.isFeatured = false,
    this.image,
    required this.details,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: const Color(0xFF49672F)),
              if (isFeatured && image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(image!, width: 40, height: 40, fit: BoxFit.cover),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...details,
          if (description != null) ...[
            const SizedBox(height: 16),
            Text(
              description!,
              style: const TextStyle(fontSize: 12, color: Color(0xFF44483D), fontStyle: FontStyle.italic),
            ),
          ],
        ],
      ),
    );
  }
}

class _GuideDetail extends StatelessWidget {
  final String label;
  final String value;
  const _GuideDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: const Color(0xFF49672F),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

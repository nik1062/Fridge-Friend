import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SustainabilityAnalyticsScreen extends StatelessWidget {
  const SustainabilityAnalyticsScreen({super.key});

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
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDkYsY1mk5kuwigrZJ5ewautyC1pMgb0dKqiTkGAUQg-HQ4YLKSfb-Aek8YXvXyUMVFLLQotDrMMGw30LBI1TGRHUIQ3agd1KXhMEPKvQGrTFlyYQSBtnwsVSFQYYrJhx68m9svWUXeZUJ-4eOHSnO7hoeyxlzqnTLq47WmbZulDI2YvOKin_SrSSQrYHrtz_DsJR9Z6MVTCLIS9lks4kzLz7qVdjfOAqu6OlXtIrtzmE-gycNkT4z91RzaFgrvxU8KuxEx-i4fm-g_',
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
          IconButton(icon: const Icon(Icons.notifications_outlined, color: Color(0xFF49672F)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.close, color: Color(0xFF49672F)), onPressed: () => context.pop()),
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
                'Analytics',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF49672F),
                  height: 1,
                  letterSpacing: -2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your impact on the planet, measured in the kitchen.',
                style: TextStyle(fontSize: 16, color: Color(0xFF44483D)),
              ),
              const SizedBox(height: 32),
              // Footprint and Top Saver Bento
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 280,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EEDB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SmallBadge(text: 'CARBON FOOTPRINT', color: const Color(0xFFCAEEA7), textColor: const Color(0xFF1C3704)),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '12.4',
                                  style: GoogleFonts.plusJakartaSans(fontSize: 40, fontWeight: FontWeight.bold, color: const Color(0xFF1D1C11)),
                                ),
                                TextSpan(
                                  text: ' kg CO₂e',
                                  style: GoogleFonts.plusJakartaSans(fontSize: 14, color: const Color(0xFF44483D)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('Reduced by 14% compared to last month.', style: TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF49672F),
                              foregroundColor: Colors.white,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('View Details', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAp7dsfcAv1aosvZ13IsUKXAREqhymC75AV5CaBpg-eBk6zQ-Mn4OMZGNNfVK8zRdZ7AxDSg9srZK1S2UKbhzGaFfqKMwEUMhH0nEFgc__Ud0YrAX-IyY1Xv7xGZeJPXrm2qRLnyIJyqFfCqXX7se4PGndo5jfhwcA_vVcmm0IDtxxvg7C9Z0BH8mFRK2KLuz2NjGzMI7IM2V2-rz2jLfmSL6WnX9UJWiahnNJpdt-g2BE5C4V6jLVHQ76ysttqBzBZ676gCMIBNcNl'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Top Saver: Leafy Greens', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("You've saved 4kg of waste by proper storage.", style: TextStyle(color: Colors.white70, fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Waste Trends Chart
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Food Waste Trends', style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text('Weekly grams of unavoidable waste', style: TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _TrendBar(height: 0.6, label: 'MON'),
                          _TrendBar(height: 0.4, label: 'TUE'),
                          _TrendBar(height: 0.85, label: 'WED', isHighlighted: true),
                          _TrendBar(height: 0.3, label: 'THU'),
                          _TrendBar(height: 0.55, label: 'FRI'),
                          _TrendBar(height: 0.7, label: 'SAT'),
                          _TrendBar(height: 0.45, label: 'SUN'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Impact Summary
              Row(
                children: const [
                  _ImpactCard(icon: Icons.savings, label: 'MONEY SAVED', value: '\$142.50', color: Color(0xFFCFE3EE)),
                  SizedBox(width: 12),
                  _ImpactCard(icon: Icons.eco, label: 'MEALS SHARED', value: '24', color: Color(0xFFCAEEA7)),
                  SizedBox(width: 12),
                  _ImpactCard(icon: Icons.water_drop, label: 'WATER SAVED', value: '1.2k L', color: Color(0xFFFFDAD7)),
                ],
              ),
              const SizedBox(height: 32),
              // Featured Tip
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF49672F),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.white, size: 40),
                    const SizedBox(height: 16),
                    Text('Sustainable Kitchen Tip', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      'Regrow your scallion ends in a glass of water on your windowsill. You can harvest them up to three times!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _SmallBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const _SmallBadge({required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }
}

class _TrendBar extends StatelessWidget {
  final double height;
  final String label;
  final bool isHighlighted;
  const _TrendBar({required this.height, required this.label, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 28,
          height: 120 * height,
          decoration: BoxDecoration(
            color: isHighlighted ? const Color(0xFF49672F) : const Color(0xFFE7E3D0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }
}

class _ImpactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _ImpactCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, size: 16, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF49672F))),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFAE7).withOpacity(0.7),
        border: Border(top: BorderSide(color: Colors.black.withOpacity(0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(icon: Icons.dashboard_outlined, label: 'Dashboard', onTap: () => context.go('/')),
          _NavIcon(icon: Icons.inventory_2_outlined, label: 'Inventory', onTap: () => context.go('/inventory')),
          _NavIcon(icon: Icons.restaurant_menu, label: 'Recipes', onTap: () => context.go('/recipes')),
          _NavIcon(icon: Icons.analytics, label: 'Analytics', isSelected: true, onTap: () {}),
        ],
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

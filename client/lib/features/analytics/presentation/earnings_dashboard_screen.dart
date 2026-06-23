import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningsDashboardScreen extends StatelessWidget {
  const EarningsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(Icons.account_balance_wallet, color: Color(0xFF49672F)),
            onPressed: () {},
          ),
        ),
        title: Text(
          'Earnings',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF49672F),
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAnwfi2gFBu5X4Ua-kGUOZ07iKGe20Vy06brbZ9LC6YTtqbQc-kKkLcRaxRDr9L8pOPUW1hY-YCEyCARFZMcrG9hmeg9-aKeozdTRRjxX-ViawcClXLOce1tqXq2567vZXldCpw0v5vECtvK9ZE2p5NcYTRUVeYyVXRzqlGbVOJbTIKQKDCGhAH0ZDF7AUXdOdqtberCW4-J1s7AMfHW7KbXmJxEoEQFUvTM8y9Iwbh6jzsVZx-u94VEUGmUZwoeY-AFgx26x9U6lv3',
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
              // Hero Section: Balance & Goal
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 240,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF49672F), Color(0xFF81A263)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: const Color(0xFF49672F).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('AVAILABLE BALANCE', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('2,840', style: GoogleFonts.plusJakartaSans(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                              const SizedBox(width: 8),
                              const Text('Eco-Credits', style: TextStyle(color: Colors.white70, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.push('/rewards'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF49672F),
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('Redeem Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 240,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              value: 0.8,
                              strokeWidth: 6,
                              backgroundColor: Colors.white,
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF49672F)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text('80%', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Text('Monthly Goal', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Earnings Growth Chart
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Earnings Growth', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                            const Text('Last 6 months', style: TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: const Color(0xFFE7E3D0), borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: const [
                              _ChartFilterChip(label: '1M'),
                              _ChartFilterChip(label: '6M', isActive: true),
                              _ChartFilterChip(label: '1Y'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _Bar(height: 0.4, label: 'JAN'),
                          _Bar(height: 0.55, label: 'FEB'),
                          _Bar(height: 0.45, label: 'MAR'),
                          _Bar(height: 0.75, label: 'APR'),
                          _Bar(height: 0.65, label: 'MAY'),
                          _Bar(height: 0.9, label: 'JUN', isHighlighted: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Sustainability Rewards List
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sustainability Rewards', style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text('View All', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    label: const Icon(Icons.arrow_forward, size: 14),
                    style: TextButton.styleFrom(foregroundColor: const Color(0xFF49672F)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const _RewardEntry(
                icon: Icons.eco,
                title: 'Zero Waste Week',
                subtitle: 'Completed all meals without spoilage',
                points: '+50',
                color: Color(0xFFCAEEA7),
              ),
              const _RewardEntry(
                icon: Icons.receipt_long,
                title: 'Smart Shopping',
                subtitle: 'Used 90% of items from previous haul',
                points: '+35',
                color: Color(0xFFCFE3EE),
              ),
              const _RewardEntry(
                icon: Icons.volunteer_activism,
                title: 'Community Donation',
                subtitle: 'Excess produce shared via Fridge Friend',
                points: '+120',
                color: Color(0xFFFFDAD7),
              ),
              const SizedBox(height: 32),
              // Cooking Banner
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCrWcZyFHGMx6C5OFlrupDRsZKYdpYiU_6XjuUxDlk1RnBFGfQlv2hiDjvY8GcB4zqD8nPDMHqyVqUP51iGZuPF5l9RXEPBN4Ai4g_iahJ5G1JaxrNHbaN7bNaCO7O28vXgASICDGeEjpba2vFDslvCeBvPrGX7D2P_v8Xa_6Q4XwuSjrQAykO35_hsOo6L1nK_W0_0WDSN-auzj8xoe0DCLKzU2pVLr1ZqHWYmH278-u_p4awuDdTHHPSE6rxK7wIvqRdsTwKNFNo1'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Earn 200+ Credits Today', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            const Text('Cook our "Zero-Waste Buddha Bowl"', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => context.push('/recipes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF49672F),
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Start Cooking'),
                      ),
                    ],
                  ),
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

class _ChartFilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  const _ChartFilterChip({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF49672F) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isActive ? Colors.white : const Color(0xFF44483D)),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final String label;
  final bool isHighlighted;
  const _Bar({required this.height, required this.label, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 120 * height,
          decoration: BoxDecoration(
            color: isHighlighted ? const Color(0xFF49672F) : const Color(0xFFCAEEA7).withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }
}

class _RewardEntry extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String points;
  final Color color;

  const _RewardEntry({required this.icon, required this.title, required this.subtitle, required this.points, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, size: 20, color: const Color(0xFF49672F)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF44483D))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(points, style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF49672F))),
              const Text('Credits', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
            ],
          ),
        ],
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
          _NavIcon(icon: Icons.inventory_2_outlined, label: 'Inventory', onTap: () => context.go('/inventory')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF49672F), Color(0xFF81A263)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.payments, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('Earnings', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _NavIcon(icon: Icons.redeem_outlined, label: 'Rewards', onTap: () => context.go('/rewards')),
          _NavIcon(icon: Icons.person_outline, label: 'Profile', onTap: () => context.go('/profile')),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF44483D)),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF44483D),
            ),
          ),
        ],
      ),
    );
  }
}

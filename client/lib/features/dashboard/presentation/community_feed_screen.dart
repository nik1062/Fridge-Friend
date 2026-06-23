import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityFeedScreen extends StatelessWidget {
  const CommunityFeedScreen({super.key});

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
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDEhAZMFbIMxswSD4xFQZvAoBXIPQgdl6aOxacZ5FDjv2qmnKSCANr1dgkk4IoiQ2WsKE_6JDQlwzZ_QeYcHqmPOVcEDUy_I_Hp17y2ypQHWNkvlCBrqWY3YjBJjoONgANP1JqWy2xTH0I4ZJROqc_ubbztwmp91R0vP1fkH2f4XSK4KP8u5-0-D6QAGjG0Wd1ZxTfrJy9YYKPGg_ntyxrh7w3_TW7HNRnDXye5iXhVQ6THWYFc-rVbhjA7QdY56uBPPMuifo7BbteQ',
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
                'NEIGHBORHOOD FEED',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.plusJakartaSans(fontSize: 40, fontWeight: FontWeight.bold, color: const Color(0xFF44483D), height: 1.1),
                  children: const [
                    TextSpan(text: 'Share more,\n'),
                    TextSpan(text: 'waste less.', style: TextStyle(color: Color(0xFF81A263), fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Featured Shared Item
              Container(
                decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBbQQjkhaSqDPPP7YwUjycSYqCftxXI5NyFhiwXrMpa5f3tPpum-HTZ4XfjuKLsgdSHTjkgfVPm7q5292Blz46mc_rLvqMF9Y9OnrHGCL1yCh8qUQ9wQqgVpSyOecyn1jw5ZDUWqgcuREWZ-cEpk7txFUGz5rktBtAyquL2NFj70WrVj-gOhSyf89DwYQ_4IeeTZGbFXbnsAZfpRiyUiu6ztb4SzJPFBr6JjOAmodjkMY_8pkJ0lph1DNgpo0fIpCKSL3Fx5MZfPR6t',
                            height: 240,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: const Color(0xFF81A263), borderRadius: BorderRadius.circular(20)),
                            child: const Text('FRESH PICKED', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Organic Backyard Lemons', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              const Text('0.4 miles away', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              const SizedBox(width: 16),
                              const Icon(Icons.person, size: 14, color: Color(0xFF49672F)),
                              const SizedBox(width: 4),
                              const Text('Sarah Miller', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF49672F),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                              child: const Text('Request'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Community Stats Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFF49672F), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.handshake, color: Colors.white70, size: 32),
                    const SizedBox(height: 16),
                    const Text(
                      "You've helped 4 neighbors this month.",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Your shared sourdough starter and basil plants saved an estimated \$45 in grocery trips for the community.",
                      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Recipe Highlight Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFE27A77).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE27A77).withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _Badge(text: 'TOP RECIPE', color: const Color(0xFFE27A77), textColor: Colors.white),
                        const Icon(Icons.favorite, color: Color(0xFF9A4341), size: 20),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Zero-Waste Pesto', style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      '"Made this using the carrot tops I got from Dave last week. Incredible!"',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF44483D)),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDqVmGd8_g3_MjtzyxeZxk31BlukrHPQusRD7na7Oduux3D763hL0EqX7sE4B5Uy1v1G8hygOP3lQHfSN9XlIFNA6cL4SyL1vmUOTyKNYheIgUbq6j7U6FJURx6zY5PESllJmPAmcjaj2nRq3hGclEHGb5CSZWKLnzjghKT7ynF7Q7UOmnqgze-FHyKtr4exsK1oc23OltmPoIjMvivNPJysKSNIoqE0X9N5PNsMNZsPmzoNHWROuAHFpn08Sm_0Glv_k74CFxbyexH')),
                        const SizedBox(width: 8),
                        const Text('Shared by James L.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
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
      bottomNavigationBar: _BottomNavBar(),
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
      child: Text(text, style: TextStyle(color: textColor, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
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
          _NavIcon(icon: Icons.search, label: 'Search', onTap: () {}),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(Icons.diversity_3, color: Color(0xFF49672F), size: 20),
                const SizedBox(width: 8),
                Text('Community', style: GoogleFonts.plusJakartaSans(color: const Color(0xFF49672F), fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _NavIcon(icon: Icons.shopping_basket_outlined, label: 'Basket', onTap: () => context.go('/shopping-list')),
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

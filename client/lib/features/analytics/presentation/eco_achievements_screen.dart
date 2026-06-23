import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EcoAchievementsScreen extends StatelessWidget {
  const EcoAchievementsScreen({super.key});

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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBd2Axd1qUFPjCzrpGcQWrsWt0gTBG9tyv1YhoZjskLcPH6pwq3uaz0MZrwhiS-ECSAdB-OaywpbEqC9y4mOIVHsP0QeNlEHmdjwExY14WNm-nxvlVuX39sd1iemGxKkE6Bd70hGZ8WR4LZUC-h5qIFcHLmh-yA1dQAOt95Seo3qPKg8L3ysdIrTFhlt7Kck4uNAX-hwrxDpAV0yR0KR0cXLAfHyXyAvC4Sh038esNgsMcifJwQqPBjJ4cYpDDpJDBkNUl2VtRlfRGj',
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
                'SUSTAINABILITY MILESTONES',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1D1C11),
                    height: 1,
                  ),
                  children: [
                    const TextSpan(text: 'Your Eco\n'),
                    TextSpan(text: 'Legacy.', style: TextStyle(color: const Color(0xFF81A263).withOpacity(0.8))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Celebrating your journey towards a circular home. Every badge earned is a step closer to a greener planet.',
                style: TextStyle(fontSize: 16, color: Color(0xFF44483D), height: 1.5),
              ),
              const SizedBox(height: 32),
              // Global Rank Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('GLOBAL RANK', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text('Top 4%', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF49672F))),
                      ],
                    ),
                    Container(width: 1, height: 40, color: Colors.black12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('BADGES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text('12/30', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Featured Achievement
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(color: const Color(0xFFCAEEA7), borderRadius: BorderRadius.circular(20)),
                                child: const Text('UNLOCKED', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF1C3704))),
                              ),
                              const SizedBox(height: 12),
                              Text('Larder Legend', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              const Text('Achieved by maintaining a zero-waste inventory for 30 consecutive days.', style: TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                            ],
                          ),
                        ),
                        const Icon(Icons.workspace_premium, size: 80, color: Color(0xFF49672F)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _SmallImpact(icon: Icons.eco, label: 'CO2 SAVED', value: '12.4 kg'),
                        const SizedBox(width: 16),
                        _SmallImpact(icon: Icons.water_drop, label: 'WATER SAVED', value: '450 L'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Achievement Progress Cards
              Row(
                children: [
                  Expanded(
                    child: _ProgressCard(
                      icon: Icons.recycling,
                      title: 'Zero Waste Hero',
                      description: 'Complete 50 recipes with current items.',
                      progress: 0.64,
                      current: 32,
                      total: 50,
                      color: const Color(0xFFCFE3EE),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: _LockedCard(
                      icon: Icons.compost,
                      title: 'Compost King',
                      description: 'Log 10kg of organic waste diversion.',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Mini Badges Quick Wins
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFF49672F), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick Wins', style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 16),
                    _MiniBadge(label: 'Bulk Buyer', isUnlocked: true),
                    _MiniBadge(label: 'Plastic Free', isUnlocked: true),
                    _MiniBadge(label: 'Meal Prepper', isUnlocked: false),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallImpact extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _SmallImpact({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF49672F), size: 16),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double progress;
  final int current;
  final int total;
  final Color color;

  const _ProgressCard({required this.icon, required this.title, required this.description, required this.progress, required this.current, required this.total, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.black54),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 10, color: Color(0xFF44483D))),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PROGRESS', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
              Text('$current/$total', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF49672F))),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(value: progress, minHeight: 6, backgroundColor: Colors.white, color: const Color(0xFF49672F)),
          ),
        ],
      ),
    );
  }
}

class _LockedCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _LockedCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFE7E3D0), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.black26, size: 32),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
          const SizedBox(height: 4),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.black26)),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 10, color: Colors.grey),
              SizedBox(width: 4),
              Text('LOCKED', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  final String label;
  final bool isUnlocked;
  const _MiniBadge({required this.label, required this.isUnlocked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white.withOpacity(isUnlocked ? 0.1 : 0.05), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(isUnlocked ? Icons.done_all : Icons.circle_outlined, color: isUnlocked ? const Color(0xFFCAEEA7) : Colors.white24, size: 16),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(color: isUnlocked ? Colors.white : Colors.white24, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

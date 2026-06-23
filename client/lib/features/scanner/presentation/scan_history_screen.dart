import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanHistoryScreen extends StatelessWidget {
  const ScanHistoryScreen({super.key});

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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDQ_6rW0dN8zoSz1NDl5tokzQ5jOXoiINkrAO-vvyYRAlVZrQq3s0qZpxywY2lJ2tlBwgpUF7eVsboz6rHU9bwnz4-pxyQLj3PiaUQ0aqhZGVVvfxkMLVbaAC0gCIu_NlQeNM5I_EjEZA3cRjAiOuAfBdGp6toqbwupnyzrL2VakvnLjlXfJL-vvJcRoC1RGZubyGz_ope-OO3bTaF1dnid6WBVFQfEWYDErjxkVhB9pHHPWIcHXsSdUHmMlU5wIrFtW5tlFCMTjnXL',
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
                'INSIGHTS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      'Scan\nHistory',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1D1C11),
                        height: 0.9,
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F4E1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Track your pantry updates through receipt and product captures. We've cataloged 124 items this month.",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xFF44483D).withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Monthly Total Card
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EEDB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.auto_awesome, color: Color(0xFF81A263), size: 32),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF81A263).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'MONTHLY TOTAL',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1C3704),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '\$412.50',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF49672F),
                            ),
                          ),
                          const Text(
                            'Saved across 14 grocery runs',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDAD7).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '82%',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9A4341),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'FRESHNESS\nACCURACY',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: const Color(0xFF7C2C2C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Recent Captures',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF44483D),
                ),
              ),
              const SizedBox(height: 16),
              const _ScanHistoryEntry(
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDBeFTf0YXbpRiwVCV0uSF3lrXKjq7IRl5vUIIpEi51FXerJjgU94OPRhszWm3U4gmEs5Ntmp664bk0Y4ebIffFhH9SXdrEUBs3QRr5fxS7K4BRlEWb8YEjwMGXhsKqkYSrUuEoBwJiGuFekxGOwW2dFt0ah6IjocFoMenoC5vsyFDqhgK_men-QKI7yYAMcXdSqgQjbWRJ7CUx7fTdLubImbh8IhYD6d2_7HlShvpFM4yJKdyOU_8uIQDY85SpkBAFbTvd_y_YjcKC',
                date: 'Oct 24, 2023',
                itemsCount: 18,
                value: 84.20,
              ),
              const _ScanHistoryEntry(
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpJ5_rhY6A97MgwXEMjvIEGClLGzBnn384sJbjl9mJ06nqOfxiuLU4IpaLyUI_3OU83PM26Uhyc-n4uQIdEng-h1O1YCQowkyAgysyR08qUlN4cD1R13xb45A4BNKicyh0w_ZVzlB7uu3qLhFAGU4qv-bW9G9diQLiATH9K90F6_JOHnGKcVKw5D7LopkcDVERV8zz5yT7eLs_c19bz1o-HJGup_z2VsZ1ZZKm2MOAx2daR3IYkkmJi9VBn2AN_mdZW8PM_kx_SBR7',
                date: 'Oct 22, 2023',
                itemsCount: 3,
                value: 12.50,
              ),
              const _ScanHistoryEntry(
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDsD2egoll_N8ZXI4tccl8l1jrYCJHLRJS0bB6PgBKvLkiG6gsumdpuW9fh9x8geqSSUndQ0djq05GKwql4UpsNXD5aA0bzBsXH79YrlFhvE2CyGp3TNkXkr4LlizBZN4_Mnjj53WDoXSJ9iY0VzwbEgTADjY8ujueabDseQ-SRxI1gbcGrtNNIRcsq3uJp6PQsXzkf0JzKzY16PRVejc8kmqo_tB-X5elbNytXd-1Jif2pgFEwmOzmVncfZ8vt-N99ajrKpII4Qety',
                date: 'Oct 19, 2023',
                itemsCount: 24,
                value: 142.10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/scanner'),
        backgroundColor: const Color(0xFF49672F),
        child: const Icon(Icons.add_a_photo, color: Colors.white),
      ),
    );
  }
}

class _ScanHistoryEntry extends StatelessWidget {
  final String image;
  final String date;
  final int itemsCount;
  final double value;

  const _ScanHistoryEntry({
    required this.image,
    required this.date,
    required this.itemsCount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _EntryInfo(label: 'DATE', value: date),
                _EntryInfo(label: 'ITEMS', value: '$itemsCount Found'),
                _EntryInfo(label: 'VALUE', value: '\$${value.toStringAsFixed(2)}'),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFCAEEA7),
                  child: Icon(Icons.chevron_right, size: 18, color: Color(0xFF1C3704)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EntryInfo extends StatelessWidget {
  final String label;
  final String value;
  const _EntryInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: const Color(0xFF44483D).withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

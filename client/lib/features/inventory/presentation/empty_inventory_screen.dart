import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyInventoryScreen extends StatelessWidget {
  const EmptyInventoryScreen({super.key});

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
          'Fridge Friend',
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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuD5R3TGWX3ftclGmK-G628wq_O-k6_BnOz0zJtrnAO3D00rvfQNZXAgyxghNomfg0XvEu-nR7vKVnUY1fi_7HT8c_c5Kh8025XFrnNK4wS3-cUgKbJlXePECMxTAdSaJrzuF6Zr7vGJC75BPSkHmO-jjjp6LJWikcV_TL1Y-pppUTU004g_OHLGI2N-GDf5oxAjlEHBXMNhKzJChQFd8D6sdxx6wjghHhk3oh3OA80LMXXcdiDhofidNGRBuouoDHppptw0gEkzpI1L',
                  fit: BoxFit.cover,
                  width: 36,
                  height: 36,
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
            children: [
              const SizedBox(height: 20),
              // Hero Illustration
              Stack(
                children: [
                  Transform.rotate(
                    angle: -0.05,
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F4E1),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuALgLy9lqZpbt-CjjpFjhelQn6DXe899CxRK-H2TuOdkZ92OkIGi_2lXf_YygXZKy9CMPUxEenoRE_bj3I0O6g81FgpHn9070xbojiYMzDcmNO-aQqASWqIUkt9gn4z85nVAnTka2j_XNDYa41bdUvSr9En8uEw4mfYFWh_NNyrKjCnFAGdGS8Q_3ePs8DSNGw6qbmekEnFHpO8uToy_LfG6gEdyVad7-gp1M7uEEKL2hZ3MlevkRmEI8YrxRRKm9ADlTZu1nowYLuK',
                        height: 280,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Typography Cluster
              Text(
                "Your larder is empty. Let's fill it with fresh finds!",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1D1C11),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Start tracking your inventory to reduce waste and plan your meals effortlessly.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF44483D),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // CTA Cluster
              Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF49672F), Color(0xFF81A263)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF49672F).withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => context.go('/scanner'),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Scan your first receipt',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFE7E3D0),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle, color: Color(0xFF44483D)),
                      SizedBox(width: 8),
                      Text(
                        'Add item manually',
                        style: TextStyle(
                          color: Color(0xFF44483D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Editorial Tip
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F4E1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb, color: Color(0xFF9A4341)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EDITORIAL TIP',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: const Color(0xFF44483D),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '"A well-organized fridge is the first step toward a more sustainable kitchen lifestyle."',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFF44483D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

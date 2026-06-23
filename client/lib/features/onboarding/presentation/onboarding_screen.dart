import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final slides = [
      const OnboardingSlide(
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2SpvdVrX07YT_8QKhw6FydEZykyVo_ZdvRok7D4A9lZR9sa2GYSgypAW2eCnZ01HRV6aABbbfYrtT5-zHdoOjjmTaKoa5wI1yjwAJspJdDttzm3upREwdMvYmGdwKjqTCZT1t23aPmcX1U8zliSy6ka2jKT-D8gt6UVuJr80pGq97oOmxJWmQVarhJbyWkLybkzOl9TOSxMfnMLnbBVUw6rjfMSiKuD8tpSf2UJzhAmC0uGHg-HYJWpaEoPHwHdRQ-ixeCs99x3Eb',
        title: 'Never lose a head of lettuce again.',
        description: 'Smart notifications alert you before your groceries go to waste. Freshness at your fingertips.',
      ),
      const OnboardingSlide(
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAyo7Fdmjh3-TcFvjOUS21avXl1IVKEG9ZpXjAciBx_GXQXsmrpAXt5jw6IR-ka2m-n-c-YAA-UpCGqtS3BU0vy65Hjep6Ysdgqb5Roh-hAzZS4IkZ-1IEJfvdjN8_TBE36hlxBenlJSaywnlUqbwUqnt1uSVcOKnsbNWxVjEThH2VG5WGiBtS2gskqEsS4N4avu8gVd25KRl76g90lusibjUq1YN1bFhujrasCJBjN17-WSYm7p6WATkuwvWpSu8FNdTq6sn4h1x3y',
        title: 'Scan. Track. Relax.',
        description: 'Our AI instantly identifies items from your receipts and adds them to your digital pantry.',
      ),
      const OnboardingSlide(
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDyUZVhym5mTVG4xA18LE6Ynt3POVdM4_dD9T1tV6gN0ddUDWaMG-pyMewzWMVdBiAtP4pkmT1OBwRN7NS2xs9XG6UCdi0q8yHBDk8Tp5nPHmR2iGRjLR-bFyzI0wDiR6wVmm-Ex4_fdKP8hanEXD7-zgZPSHe5i-iWED3nUg2hzotSL-bfCCBSt4akHJbNzNCxw1lmdTgEstnXpIi9XNKdz9r3srj03WWHcBDSs-auyBm6JimPmkNgVcCbvd2amhJyCah0Zsy5sGz3',
        title: 'Cook what you have.',
        description: 'Personalized recipe suggestions based solely on your current inventory. Sustainable living made simple.',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Branding Header
            Column(
              children: [
                const Icon(Icons.restaurant, color: Color(0xFF49672F), size: 48),
                Text(
                  'Fridge Friend',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF49672F),
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  'YOUR KITCHEN, CURATED',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF44483D).withOpacity(0.6),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Carousel Section
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) => currentPage.value = index,
                itemCount: slides.length,
                itemBuilder: (context, index) => slides[index],
              ),
            ),
            // Footer Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  // Visual Stepper
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      slides.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: currentPage.value == index ? 32 : 6,
                        decoration: BoxDecoration(
                          color: currentPage.value == index
                              ? const Color(0xFF49672F)
                              : const Color(0xFFC4C8BA),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Primary CTA Cluster
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.go('/signup'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF49672F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 4,
                        shadowColor: const Color(0xFF49672F).withOpacity(0.2),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      'Already have an account? Sign In',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF44483D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Skip to Dashboard
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text(
                'Skip to Dashboard',
                style: TextStyle(
                  color: Color(0xFF49672F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24, left: 40, right: 40),
              child: Text(
                '"The average household wastes \$1,500 of food every year. Let\'s change that together."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                  color: Color(0xFF44483D),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingSlide({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1D1C11),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.beVietnamPro(
              fontSize: 16,
              color: const Color(0xFF44483D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

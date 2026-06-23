import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SmartScannerScreen extends HookWidget {
  const SmartScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isScanning = useState(true);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFCAEEA7),
            child: ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCZbjpMJqT07vVufDMDFQmTqge7MDFg5zx5DNOrLez65jRPY2REWrwkZnbU36VHkcM4k-sa03Jy1ykx77lOgkTeyBCSiXczEKLEuSUQ5JrDhya0i_LaBYXmh3-u7vN7_Y3lJKpoyI8S-XdyiF4v3vli-_XB8ijA8_R57-NBngYuIC3nUU1EtWOapzuPiqEZRbvnBMHFMy9gEpepjk7z5HRlAQkMnPy19ivK67qWvJg0aFtG0GVwPnd08mFxtNUwvij5spAWVILIXjDf',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          'Fridge Friend',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFFCAEEA7),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // Mobile Scanner
          MobileScanner(
            onDetect: (capture) {
              // Handle barcode/QR detection if needed
            },
          ),
          // Background Overlay (Semi-transparent)
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Scanner Frame
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomPaint(
                painter: ScannerFramePainter(),
                child: Stack(
                  children: [
                    // Animated Scanning Line
                    const ScanningLine(),
                    // Detected Text Bubbles (Mockup for now)
                    Positioned(
                      top: 100,
                      left: 20,
                      child: _DetectedItemBubble(
                        label: 'Milk - \$4.50',
                        onTap: () => context.push('/inventory'),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      right: 20,
                      child: _DetectedItemBubble(
                        label: 'Eggs - \$3.00',
                        onTap: () => context.push('/inventory'),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 40,
                      child: _DetectedItemBubble(
                        label: 'Spinach - \$2.25',
                        onTap: () => context.push('/inventory'),
                      ),
                    ),
                    // Processing Indicator
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.bottom(24),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF49672F).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFCAEEA7).withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            'ANALYZING ITEMS...',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Camera Controls
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ScannerControlButton(
                    icon: Icons.flash_on,
                    onPressed: () {},
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.5), width: 4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  _ScannerControlButton(
                    icon: Icons.image_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _ScannerBottomNav(),
    );
  }
}

class _DetectedItemBubble extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DetectedItemBubble({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF49672F), size: 14),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF44483D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ScannerControlButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

class _ScannerBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFAE7).withOpacity(0.7),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(icon: Icons.dashboard_outlined, label: 'Dashboard', onTap: () => context.go('/')),
          _NavIcon(icon: Icons.inventory_2_outlined, label: 'Inventory', onTap: () => context.go('/inventory')),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF49672F), Color(0xFF81A263)]),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.center_focus_strong, color: Colors.white, size: 28),
          ),
          _NavIcon(icon: Icons.restaurant_menu, label: 'Recipes', onTap: () => context.go('/recipes')),
          _NavIcon(icon: Icons.analytics_outlined, label: 'Analytics', onTap: () => context.go('/analytics')),
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

class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF81A263)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const cornerLength = 40.0;

    // Top Left
    canvas.drawLine(const Offset(0, 0), const Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, cornerLength), paint);

    // Top Right
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), paint);

    // Bottom Left
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), paint);

    // Bottom Right
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ScanningLine extends HookWidget {
  const ScanningLine({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Positioned(
          top: animationController.value * MediaQuery.of(context).size.height * 0.6,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF81A263).withOpacity(0.8),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
              color: const Color(0xFFCAEEA7),
            ),
          ),
        );
      },
    );
  }
}

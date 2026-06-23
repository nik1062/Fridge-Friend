import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodWasteLeaderboardScreen extends StatelessWidget {
  const FoodWasteLeaderboardScreen({super.key});

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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCxVbmIjao3lgwPeAJ1bMNqSFSlL9yy6ostwRHo-z9jLvS_XufBstbq4N1b71Zcd_C5QWky0EJ_vJxfIqAVuZxtgx-BSBmJBjglj5kzpMMnaClVfu0GFjJFERlCm4SICjurc9yluB3Q2c5-PrfgK03k8OxSd8Ua0ZHW2Z-C_MsZkdXtkkLJfUNOIEzj1SoCD4kKtFsQHkg2DoDceqUTomOv1hIuO1Fvgsbm9vYcCfVa0EFAYoauFuczf_aTWVTce8oBh2g-vY1zujtl',
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
              // Hero Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CURRENT STANDING',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: const Color(0xFF49672F),
                        ),
                      ),
                      Text(
                        '#14',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D1C11),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '82%',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF81A263),
                        ),
                      ),
                      const Text(
                        'Efficiency Score',
                        style: TextStyle(fontSize: 12, color: Color(0xFF44483D)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Carbon Stats Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Your climate impact this month', style: TextStyle(fontSize: 12, color: Color(0xFF44483D))),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold, color: const Color(0xFF49672F)),
                            children: const [
                              TextSpan(text: '12.4kg CO₂ '),
                              TextSpan(text: 'Saved', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xFF44483D))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Opacity(opacity: 0.2, child: Icon(Icons.eco, size: 64, color: Color(0xFF49672F))),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Community Leaders
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Community Leaders', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFFE7E3D0), borderRadius: BorderRadius.circular(20)),
                    child: const Text('This Week', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const _LeaderboardRow(
                rank: 1,
                name: 'Elena Green',
                points: '2,450 pts',
                subtitle: '24 Items Shared',
                badge: 'Eco-Master',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDl8TvKwvKzLnTytOgnmM3Zm1M4TlR82OOk5h6Rmfg-AKt_wyd060PrM74GscuN5ylgTRX4NkpVXR933fKKkYgRHK0Iv7m9Zw5tZYbnYnKyGiu3fcLOaS2x1fLGdvyshfZ0BF8gvrkaYXzxiUb2co4qPzn-YQM6gDGtnrneUTxua9mRrduXfziQKCM3NPzokatA2CHMCWkd1ch5TRmOwsSZdP11WzcccHrG0A4hndwUSjD_NgXjOOgLHS4XBqEb9_eCJMbcXJwu30v9',
              ),
              const _LeaderboardRow(
                rank: 2,
                name: 'Marcus Chen',
                points: '2,120 pts',
                subtitle: '19 Items Shared',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCGjyZKdwqSQTnXG-6wAs-FoY0vtHDSooUtCa0GhauW3xZUn0LvBIV88lfjG1v0RziSOrYElUC_L7Z081XbvP3vSQPvPYBS1c5sfx6mm3OYEJa70Z0-6iTLbUm5X9l1qDQSbetRSkz0Eo-QCh1V_4a6-MA2jSqyGQ8Ezi7iBkWt00fOu1TSJK2wjCPiwjNIMrcpMrfhE9X0Ebd4TUEJUS5JOMAA-GiA-L4S_A13lplItzVd0pJkvnZFQ02VeBvC2ZBkSwWN49KV9BfH',
              ),
              const _LeaderboardRow(
                rank: 14,
                name: 'You (Sami)',
                points: '840 pts',
                subtitle: '6 Items Shared',
                isUser: true,
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDdmPVcVTD9yAqiNcbDHvq2uWkpYsbvlkQdWa_iuyzq9U3j4lW-yLUvsYYnhW_oTBRV13nZVvpkRf8ANIoF-B8HF3Ku4-5SixiN1NITkjgtTyB_bcuacfaW_GTjgSnO0HPPXvWgrhLOsh1IogLSfFfZpDlIYbtph0vH-IeT_u_2T7tEdiwXXK49jo12kA94jTHlIhRy8KLi6tTXAZ3grGa889JLDLg_5J8MGpq-5JgLVj9eBu6_d7DmxnwJSgo0XtgOv-qX-Qjuvdvw',
              ),
              const _LeaderboardRow(
                rank: 15,
                name: 'Jordan Smith',
                points: '815 pts',
                subtitle: '4 Items Shared',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCwHUHt5u6SvXtOMWtiF5kCoRqLvZtH5TcCbP7__m75Wom75_-EbrZJSvPC4ixDVv1mNDgSMChAVnnoXOpheAk9GAom1XSG4NYWdNaN1GlhhBkeKWJcab-BNLN1hWEdUGUK20MVBuAjsEKj9SVEWrWMWGwL1xqjhcJs_URbojQXGTL0tWuvwCY1Q2ztcoOCC3JAo3Pz4d_i89ggnkFWMQ8V3BB5AxPgKtOVHQ_vaRlifNOhiXud7StZI9RG4Y1a6nHIsKteSWA8aZzU',
              ),
              const SizedBox(height: 40),
              // Climb the Ranks
              Text('Climb the Ranks', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFCFE3EE), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('The Pantry Purge', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xFF374953))),
                          const Text('List 3 items before they expire this week for +500 bonus pts.', style: TextStyle(fontSize: 12, color: Color(0xFF53656F))),
                        ],
                      ),
                    ),
                    const Opacity(opacity: 0.4, child: Icon(Icons.inventory_2, size: 40, color: Color(0xFF4F616B))),
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

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final String name;
  final String points;
  final String subtitle;
  final String? badge;
  final String image;
  final bool isUser;

  const _LeaderboardRow({required this.rank, required this.name, required this.points, required this.subtitle, this.badge, required this.image, this.isUser = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isUser ? 20 : 16),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xFF49672F) : const Color(0xFFF8F4E1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isUser ? [BoxShadow(color: const Color(0xFF49672F).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))] : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$rank',
              style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: isUser ? Colors.white : const Color(0xFF49672F)),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: isUser ? Colors.white : const Color(0xFF1D1C11))),
                Text(subtitle, style: TextStyle(fontSize: 10, color: isUser ? Colors.white70 : const Color(0xFF44483D))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(color: const Color(0xFFCAEEA7), borderRadius: BorderRadius.circular(10)),
                  child: const Text('ECO-MASTER', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF1C3704))),
                ),
              Text(points, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: isUser ? Colors.white : const Color(0xFF49672F))),
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
                const Icon(Icons.leaderboard, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('Leaderboard', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _NavIcon(icon: Icons.settings_outlined, label: 'Settings', onTap: () => context.go('/settings')),
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

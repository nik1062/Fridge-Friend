import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardsShopScreen extends StatelessWidget {
  const RewardsShopScreen({super.key});

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
          'Rewards',
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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB44GTokPp3jaDMyujwc_41Lv_hbqjurrlXkDahNGvkcE7EdcgQxFdRL_sUuNOn8Cgy33bK3GIxdi_t1-0tbbBuj7t_PnBga4r7OtHbqkCdUhipp3xp6Rjeeefpa11xRUhyulQaPp1hmPnmVUOUNatAkUR0-OFH3qwdoMbmM0dfoGBdbpxk8L2lwdAdRz1RAhMaZlENKaL4hqlUcg7JreGaWS-pAPgGeodeTyqINyJQE2ewv0ptnRHn91oWNpmdqbC7RdluhCL7cZ5H',
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
              Text(
                'YOUR BALANCE',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF49672F),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '2,450',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D1C11),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Eco-Credits',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF81A263),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Impact Info Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: const Color(0xFFF2EEDB), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFF49672F), Color(0xFF81A263)]),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.eco, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "You've saved 12kg of food waste this month. Keep it up!",
                        style: TextStyle(fontSize: 13, color: Color(0xFF44483D)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Featured Reward
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuATN4znsTqvwrAHG4tS1euyJzi-CMf65Y6w_cI-rdoae4piX_l3ayxyf3rlkFvWA3gLwfb5R8asagl50myqec3yQnhjd8mM2FQ0G4d5hINF0b12UWcMvY37XAHusEaGYYauUbD9cRphaXXTnBIhc_c36ljAcg2pCrCsM1zEFy16Zzep9b_ewvCC2i07lLSDLh8xr_KOD8ESfc6HtKbzIZ5La2pixOjxNtoIvjLEu-gPD5mCfk-1SiOs9r-kDy0nGCLmbjF1kZw9lqwQ'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Badge(text: 'MOST POPULAR', color: const Color(0xFFE27A77), textColor: const Color(0xFF400006)),
                        const SizedBox(height: 12),
                        Text('Premium Subscription', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Unlock exclusive recipes, advanced tracking metrics, and priority pickup.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF49672F),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                          child: const Text('Redeem for 1,200 Credits'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Grid of rewards
              Row(
                children: [
                  Expanded(
                    child: _RewardCard(
                      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDb8p6Jl97qS5SqHmq87z6nYUR8SLxvhOpDs7YTvbuHmEDYQb3PXBC42pgAPPlC6RTIk3uuvCYtDpwfAUtv1cJP4L7g9A9cN4BWEL4Lur6mlmz-SJ7qXDQxqQZVRZXTBR55nu92OT_AFfGoL-Xwy25VqxAk1QKMGbCS0bKtz7jUSW9P-_P6jP2SaINvelLyqtETyo5l_-eAigZNAVaYLvW_3PCdqLj-O1Jj-dB2X3YGp0Xta74HDiPRCZqjlXPpU6Lfr5s1w9jXE_8Z',
                      title: 'Silicone Bags',
                      credits: '450 Credits',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _RewardCard(
                      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDQQOviZUs3jKFvQP8wEJrrPmqilAsvL1rZ7hz5oGtp6GR75I7UNa7qxLVPpBqn9ko61RAXzYIuOPaiA37_Fs16Iar3P03CeBBBlA9cefhtKRkO3TJyEOzhtnjOykQ39_RYy8sDXTR-j2ppNcpF_J47DJD9Z-GCM2_DeY0gzpjEfZCShfC-7Jta7BGySycIvIQzmVGdPH4-bQLDDjOiQJSqIELnVIH40vkgrq_PmeFxUFSCcpwLawpJzmqUQygV9v5K8M7dh9qdpQ9M',
                      title: 'Artisan Honey',
                      credits: '600 Credits',
                      isNew: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Earn More Teaser
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EEDB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Earn more credits?', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Log your daily meals and prevent food waste to earn extra Eco-Credits every week.', style: TextStyle(color: Color(0xFF44483D), fontSize: 14)),
                    const SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Text('LEARN HOW TO EARN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      label: const Icon(Icons.arrow_forward, size: 16),
                      style: TextButton.styleFrom(foregroundColor: const Color(0xFF49672F), padding: EdgeInsets.zero),
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

class _RewardCard extends StatelessWidget {
  final String image;
  final String title;
  final String credits;
  final bool isNew;

  const _RewardCard({required this.image, required this.title, required this.credits, this.isNew = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF8F4E1), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(image, height: 140, width: double.infinity, fit: BoxFit.cover)),
              if (isNew)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF9A4341), borderRadius: BorderRadius.circular(8)),
                    child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(credits, style: const TextStyle(fontSize: 12, color: Color(0xFF49672F), fontWeight: FontWeight.bold)),
              const Icon(Icons.add_shopping_cart, size: 18, color: Color(0xFF44483D)),
            ],
          ),
        ],
      ),
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
          _NavIcon(icon: Icons.inventory_2_outlined, label: 'Inventory', onTap: () => context.go('/inventory')),
          _NavIcon(icon: Icons.payments_outlined, label: 'Earnings', onTap: () => context.go('/earnings')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF49672F), Color(0xFF81A263)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.redeem, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('Rewards', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
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

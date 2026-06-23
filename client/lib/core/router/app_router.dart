import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/auth/presentation/otp_verification_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/dashboard/presentation/community_feed_screen.dart';
import '../../features/dashboard/presentation/rewards_shop_screen.dart';
import '../../features/inventory/presentation/inventory_hub_screen.dart';
import '../../features/inventory/presentation/empty_inventory_screen.dart';
import '../../features/inventory/presentation/add_item_manually_screen.dart';
import '../../features/inventory/presentation/item_detail_screen.dart';
import '../../features/analytics/presentation/grocery_budgeter_screen.dart';
import '../../features/analytics/presentation/sustainability_analytics_screen.dart';
import '../../features/analytics/presentation/earnings_dashboard_screen.dart';
import '../../features/analytics/presentation/eco_achievements_screen.dart';
import '../../features/analytics/presentation/food_waste_leaderboard_screen.dart';
import '../../features/inventory/presentation/storage_guide_screen.dart';
import '../../features/inventory/presentation/shopping_list_screen.dart';
import '../../features/recipes/presentation/recipe_matcher_screen.dart';
import '../../features/recipes/presentation/recipe_detail_screen.dart';
import '../../features/recipes/presentation/meal_planner_screen.dart';
import '../../features/scanner/presentation/smart_scanner_screen.dart';
import '../../features/scanner/presentation/scan_history_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';

// Placeholder screens - will be replaced as we build them
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({required this.title, super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('Screen: $title')),
      );
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding', 
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding_welcome',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/otp',
        name: 'otp_verification',
        builder: (context, state) => const OTPVerificationScreen(),
      ),
      GoRoute(
        path: '/empty',
        name: 'empty_state',
        builder: (context, state) => const EmptyInventoryScreen(),
      ),
      // Dashboard & Main Tabs
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/community',
        name: 'community_feed',
        builder: (context, state) => const CommunityFeedScreen(),
      ),
      GoRoute(
        path: '/rewards',
        name: 'rewards_shop',
        builder: (context, state) => const RewardsShopScreen(),
      ),
      GoRoute(
        path: '/inventory',
        name: 'inventory_hub',
        builder: (context, state) => const InventoryHubScreen(),
      ),
      GoRoute(
        path: '/add-item',
        name: 'add_item_manually',
        builder: (context, state) => const AddItemManuallyScreen(),
      ),
      GoRoute(
        path: '/item-detail',
        name: 'item_detail_view',
        builder: (context, state) => const ItemDetailScreen(),
      ),
      GoRoute(
        path: '/storage-guide',
        name: 'storage_guide',
        builder: (context, state) => const StorageGuideScreen(),
      ),
      GoRoute(
        path: '/shopping-list',
        name: 'shopping_list',
        builder: (context, state) => const ShoppingListScreen(),
      ),
      GoRoute(
        path: '/scanner',
        name: 'ai_smart_scanner',
        builder: (context, state) => const SmartScannerScreen(),
      ),
      GoRoute(
        path: '/scan-history',
        name: 'scan_history',
        builder: (context, state) => const ScanHistoryScreen(),
      ),
      GoRoute(
        path: '/recipes',
        name: 'recipe_matcher',
        builder: (context, state) => const RecipeMatcherScreen(),
      ),
      GoRoute(
        path: '/recipe-detail',
        name: 'recipe_detail_view',
        builder: (context, state) => const RecipeDetailScreen(),
      ),
      GoRoute(
        path: '/meal-planner',
        name: 'meal_planner',
        builder: (context, state) => const MealPlannerScreen(),
      ),
      GoRoute(
        path: '/budget',
        name: 'grocery_budgeter',
        builder: (context, state) => const GroceryBudgeterScreen(),
      ),
      GoRoute(
        path: '/analytics',
        name: 'sustainability_analytics',
        builder: (context, state) => const SustainabilityAnalyticsScreen(),
      ),
      GoRoute(
        path: '/earnings',
        name: 'earnings_dashboard',
        builder: (context, state) => const EarningsDashboardScreen(),
      ),
      GoRoute(
        path: '/achievements',
        name: 'eco_achievements',
        builder: (context, state) => const EcoAchievementsScreen(),
      ),
      GoRoute(
        path: '/leaderboard',
        name: 'food_waste_leaderboard',
        builder: (context, state) => const FoodWasteLeaderboardScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const PlaceholderScreen(title: 'Settings'),
      ),
    ],
  );
});

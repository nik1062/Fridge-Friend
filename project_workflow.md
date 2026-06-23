# Project Workflow & Architecture: Fridge Friend

## 1. Project Overview
Fridge Friend is an AI-powered smart inventory and sustainability tracking application designed to help users manage their groceries, reduce food waste, and track their eco-impact. The platform includes a mobile app built with Flutter and a backend powered by Node.js and MongoDB. 

**Main Purpose:** Help users track their food inventory, prevent waste, match recipes with available ingredients, and earn rewards for sustainable habits.
**Primary Users:** Individuals and households managing their groceries.

## 2. Tech Stack
- **Frontend:** Flutter (Dart), Riverpod (State Management), GoRouter (Navigation).
- **Backend:** Node.js (Express).
- **Database:** MongoDB.
- **APIs:** RESTful APIs for authentication, inventory management, recipes, and user analytics.
- **AI/ML:** Google ML Kit (Text Recognition/Barcode Scanning) / AI integrations for receipt parsing and recipe matching.
- **Local Database:** Isar for offline-first caching.

## 3. Folder Structure Explanation
- **client/lib/core**: Essential shared logic (theme, widgets, routing, config).
- **client/lib/features**: Domain-specific features (auth, dashboard, inventory, scanner, recipes, analytics, settings).
- **server/src**: Backend source code (controllers, models, routes).
- **stitch_fridge_friend_eco_tracker**: Reference UI prototypes and designs for the 28 planned app screens.

## 4. Application Flow
1. **Startup**: `main.dart` initializes routing and theme. User lands on Onboarding or Login/Sign Up based on auth state.
2. **Auth**: User authenticates via JWT.
3. **Dashboard**: Main overview showing quick actions, expiring items, and eco-stats.
4. **Inventory Management**: Users can add items via AI Smart Scanner (receipts/barcodes) or manually.
5. **Consumption & Waste**: Items are tracked for expiration. Users log items as consumed or wasted, updating their sustainability analytics.
6. **Recipes**: Recipe Matcher suggests recipes based on current inventory to prevent waste.

## 5. Planned 28 Features (Based on UI Prototypes)
1. Onboarding Welcome
2. Sign Up
3. Login
4. OTP Verification
5. Empty State
6. Dashboard
7. AI Smart Scanner
8. Add Item Manually
9. Scan History
10. Inventory Hub
11. Item Detail View
12. Storage Guide
13. Shopping List
14. Grocery Budgeter
15. Recipe Matcher
16. Recipe Detail View
17. Meal Planner
18. Sustainability Analytics
19. Eco Achievements
20. Food Waste Leaderboard
21. Community Feed
22. Rewards Shop
23. Earnings Dashboard
24. Payout Bills
25. Shared Household
26. Profile Preferences
27. Settings
28. Notification Center

## 6. Current State & Next Steps
- **Completed**: Base Flutter project initialization, core folder structure, package dependencies setup.
- **In Progress**: Implementing the 28 application screens, hooking up Riverpod state management, and connecting the Node.js backend to the Flutter frontend.
- **To-Do**: Fully integrate AI scanning, complete backend endpoints, and implement the admin dashboard for managing the global database and content moderation.

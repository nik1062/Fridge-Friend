# 🥑 Fridge Friend & Eco Tracker

An AI-powered smart inventory and sustainability tracking application designed to help users manage groceries, minimize food waste, and track their eco-impact. This project features a cross-platform mobile app built with Flutter and a RESTful backend powered by Node.js, Express, and MongoDB.

---

## 🚀 Key Features

* **AI Smart Scanner**: Instantly parse grocery receipts and barcodes to log items.
* **Smart Inventory**: Track item shelf-life, location (Fridge/Pantry/Freezer), and custom categories.
* **Sustainability Analytics**: Track carbon footprint reduction, money saved, and food wasted.
* **Recipe Matcher**: Discover recipes based on ingredients you already have in stock to prevent waste.
* **Eco Achievements**: Earn rewards and achievements for adopting sustainable kitchen habits.

---

## 📁 Repository Structure

```
Fridge Friend/
├── client/              # Cross-platform Flutter application (Dart)
├── server/              # RESTful API Backend (Node.js, Express, MongoDB)
└── stitch_fridge_friend_eco_tracker/ # Interactive UI prototype designs (28 Screens)
```

---

## 🛠️ Tech Stack

### Mobile Client
* **Core**: [Flutter](https://flutter.dev/) (Dart)
* **State Management**: [Riverpod / Hooks](https://riverpod.dev/)
* **Routing**: [GoRouter](https://pub.dev/packages/go_router)
* **Local Caching**: [Isar DB](https://isar.dev/)
* **AI/ML**: [Google ML Kit](https://developers.google.com/ml-kit) (Text Recognition & Barcode Scanner)

### Backend API
* **Runtime**: [Node.js](https://nodejs.org/) with [Express](https://expressjs.com/)
* **Database**: [MongoDB](https://www.mongodb.com/) (using [Mongoose](https://mongoosejs.com/))
* **Authentication**: JSON Web Tokens (JWT) & bcrypt encryption
* **Logging & Middlewares**: Morgan, CORS, Dotenv

---

## ⚙️ Getting Started

### 1. Backend Setup (`server/`)
1. Navigate to the server folder:
   ```bash
   cd server
   ```
2. Install Node dependencies:
   ```bash
   npm install
   ```
3. Create a `.env` file in the `server/` directory and configure your variables:
   ```env
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/fridge-friend
   JWT_SECRET=your_super_secret_jwt_key
   NODE_ENV=development
   ```
4. Start the development server (using Nodemon):
   ```bash
   npm run dev
   ```

### 2. Frontend Setup (`client/`)
1. Make sure you have the [Flutter SDK installed](https://docs.flutter.dev/get-started/install).
2. Navigate to the client folder:
   ```bash
   cd client
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on a connected device/emulator:
   ```bash
   flutter run
   ```

---

## 🧑‍💻 Feature Screens Built (Prototypes Reference)
The repository contains 28 planned application screen designs:
1. Onboarding Welcome
2. Authentication (Sign Up, Login, OTP Verification)
3. Smart Scanner & Scan History
4. Inventory Hub & Storage Guide
5. Sustainability Analytics & Eco Achievements
6. Community Feed & Food Waste Leaderboards
7. Rewards Shop & Earnings/Payout dashboards
8. Profile & Preferences settings

---

## 📄 License
This project is licensed under the ISC License.

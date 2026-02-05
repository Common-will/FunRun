# 🏃 FunRun Project: Connected Runner UI Overhaul

## 📅 Date: 2026-02-05
## 🎯 Goal
Implement the **"Connected Runner"** theme and restructure the app UI to focus on potential social interaction and a fun, engaging running experience.

---

## 🎨 1. Design Concept & Theme (`Connected Runner`)
*   **Colors**:
    *   **Background**: `Solar White` / `Midnight Carbon` (Day/Night)
    *   **Primary**: `Unity Teal` (협력/연결), `Partner Lavender` (친밀감)
    *   **Accent**: `Spark Orange` (에너지), `Luminous Lime` (야간 하이라이트)
*   **Typography**: Clean, Modern, legible text hierarchy.

## 📱 2. UI Structure & Navigation
The app uses a `MainShell` structure with a custom `BottomNavigationBar`.

### 🧭 Navigation Logic (`MainShell`)
The bottom bar has 5 items but uses discrete logic for the center button:
1.  **News**: Card-style news feed.
2.  **Stats**: Charts and records.
3.  **RUN (Center)**:
    *   *If not on Home:* Navigates to **Home (Map)**.
    *   *If on Home:* Starts **Running Mode (`MapScreen`)**.
4.  **Friends**: Social groups and friend lists.
5.  **Settings**: App configuration.

> **Key Code**: `apps/mobile_app_flutter/lib/screens/main_shell.dart`

---

## 🛠️ 3. Key Implementations

### A. Home Screen (`HomeTabScreen`)
Instead of a list, the home screen is now an interactive map dashboard.
*   **Stack Layout**:
    *   **Layer 1**: `CuteMapBackground` (Full screen)
    *   **Layer 2**: Markers (Hot Run, Crew, etc.)
    *   **Layer 3**: `MiniProfile` (Top Left, Expandable)
    *   **Layer 4**: `InfoOverlay` (Top Right, Weather/Goals)

### B. Cute Map Background (`CuteMapBackground`)
A custom widget to simulate a map aesthetic without needing API keys during dev.
*   **Mechanism**: Uses `CustomPainter` to draw pastel-colored land, water, parks, and roads.
*   **Theme Aware**: Automatically adjusts colors for Dark Mode.
*   **Path**: `apps/mobile_app_flutter/lib/widgets/cute_map_background.dart`

### C. Profile System (`ProfileScreen`)
*   **Design**: ID Card style.
*   **Interaction**: Can be shown as a full screen or a popup dialog from the Home screen mini-profile.

---

## 📂 4. Project Structure (Flutter)
```
lib/
├── main.dart                  # Entry Point
├── theme/
│   └── app_colors.dart        # Theme Color Definitions
├── services/
│   └── api_service.dart       # Backdrop Backend Connection
├── widgets/
│   └── cute_map_background.dart # Custom Map Painter
└── screens/
    ├── login_screen.dart      # Demo/Actual Login
    ├── main_shell.dart        # Navigation Controller
    ├── home_tab_screen.dart   # Main Map Dashboard
    ├── map_screen.dart        # Active Running Session
    ├── news_screen.dart
    ├── stats_screen.dart
    ├── friends_screen.dart
    ├── profile_screen.dart
    └── settings_screen.dart
```

---

## ✅ 5. Next Steps (TODO)
- [ ] **Google Maps Integration**: Replace `CuteMapBackground` with real Google Maps API (apply custom JSON style).
- [ ] **Data Binding**: Connect mock data (weather, profile stats, markers) to Backend API.
- [ ] **Sensor Integration**: Implement GPS tracking in `MapScreen`.

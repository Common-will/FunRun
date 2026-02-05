import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'home_tab_screen.dart';
import 'news_screen.dart';
import 'stats_screen.dart';
import 'friends_screen.dart';
import 'settings_screen.dart';
import 'map_screen.dart'; // 실제 러닝 측정 화면

/// 메인 앱 쉘 - 하단 탭바 + 화면 전환
class MainShell extends StatefulWidget {
  final String userId;
  const MainShell({super.key, required this.userId});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 2; // 기본: Home (중앙 RUN 버튼 위치를 Home으로 간주)

  // 실제 화면 인덱스 매핑 (Home은 탭에 없지만 화면으로는 존재)
  // 0: News, 1: Stats, 2: Home(Map), 3: Friends, 4: Settings
  // 탭바 UI: [News] [Stats] [RUN] [Friends] [Settings]

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const NewsScreen(), // 0
          StatsScreen(userId: widget.userId), // 1
          HomeTabScreen(userId: widget.userId), // 2 (RUN/HOME)
          FriendsScreen(userId: widget.userId), // 3
          const SettingsScreen(), // 4
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(isDark),
    );
  }

  Widget _buildBottomNavBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background(isDark),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                0,
                Icons.newspaper_outlined,
                Icons.newspaper,
                'News',
                isDark,
              ),
              _buildNavItem(
                1,
                Icons.bar_chart_outlined,
                Icons.bar_chart,
                'Stats',
                isDark,
              ),

              // 중앙 RUN 버튼 (Home 역할 겸 러닝 시작)
              _buildCenterRunButton(isDark),

              _buildNavItem(
                3,
                Icons.people_outline,
                Icons.people,
                'Friends',
                isDark,
              ),
              _buildNavItem(
                4,
                Icons.settings_outlined,
                Icons.settings,
                'Settings',
                isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
    bool isDark,
  ) {
    final isSelected = _currentIndex == index;
    final color = isSelected
        ? AppColors.unityTeal
        : AppColors.textSecondary(isDark);

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isSelected ? filledIcon : outlinedIcon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  /// 중앙 RUN 버튼 - 핵심 로직
  Widget _buildCenterRunButton(bool isDark) {
    final isHomeSelected = _currentIndex == 2; // Home 화면에 있는지 확인

    return GestureDetector(
      onTap: () {
        if (!isHomeSelected) {
          // A. 다른 탭에 있다면 -> Home(지도)으로 이동
          setState(() => _currentIndex = 2);
        } else {
          // B. 이미 Home이라면 -> 러닝 시작 (MapScreen 이동)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(userId: widget.userId),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.sparkOrange,
                  AppColors.sparkOrange.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.sparkOrange.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.directions_run,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'RUN',
            style: TextStyle(
              color: isHomeSelected
                  ? AppColors.sparkOrange
                  : AppColors.textSecondary(isDark),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

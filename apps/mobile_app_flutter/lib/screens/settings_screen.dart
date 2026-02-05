import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// 설정 화면
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Account', isDark),
          _buildSettingItem(isDark, Icons.person_outline, 'Edit Profile'),
          _buildSettingItem(isDark, Icons.lock_outline, 'Privacy Settings'),
          _buildSettingItem(
            isDark,
            Icons.notifications_outlined,
            'Notifications',
          ),
          const SizedBox(height: 24),

          _buildSectionTitle('Connected Apps', isDark),
          _buildConnectedApp(isDark, '🎵', 'Spotify', true),
          _buildConnectedApp(isDark, '⌚', 'Apple Watch', false),
          _buildConnectedApp(isDark, '💪', 'Apple Health', true),
          _buildConnectedApp(isDark, '📍', 'Strava', false),
          const SizedBox(height: 24),

          _buildSectionTitle('Preferences', isDark),
          _buildSettingItem(isDark, Icons.dark_mode_outlined, 'Dark Mode'),
          _buildSettingItem(isDark, Icons.language, 'Language'),
          _buildSettingItem(isDark, Icons.straighten, 'Units (km/mi)'),
          const SizedBox(height: 24),

          _buildSectionTitle('Support', isDark),
          _buildSettingItem(isDark, Icons.help_outline, 'Help Center'),
          _buildSettingItem(isDark, Icons.feedback_outlined, 'Send Feedback'),
          _buildSettingItem(isDark, Icons.info_outline, 'About FunRun'),
          const SizedBox(height: 24),

          // 로그아웃
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // 앱 버전
          Center(
            child: Text(
              'FunRun v1.0.0',
              style: TextStyle(
                color: AppColors.textSecondary(isDark),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textSecondary(isDark),
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingItem(bool isDark, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.unityTeal, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary(isDark),
                fontSize: 15,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary(isDark),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedApp(
    bool isDark,
    String emoji,
    String name,
    bool connected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: AppColors.textPrimary(isDark),
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: connected
                  ? AppColors.unityTeal.withOpacity(0.2)
                  : AppColors.textSecondary(isDark).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              connected ? 'Connected' : 'Connect',
              style: TextStyle(
                color: connected
                    ? AppColors.unityTeal
                    : AppColors.textSecondary(isDark),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

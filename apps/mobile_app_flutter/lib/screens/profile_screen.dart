import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// 프로필 화면 - 신분증 스타일 카드
class ProfileScreen extends StatelessWidget {
  final String userId;
  final bool isDialog; // 팝업으로 띄울 때 true

  const ProfileScreen({super.key, required this.userId, this.isDialog = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      // 다이얼로그일 땐 배경 투명/닫기 버튼 추가
      appBar: isDialog
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // 프로필 카드 (신분증 스타일)
                _buildProfileCard(isDark),
                const SizedBox(height: 32),

                // 뱃지 섹션
                _buildBadgeSection(isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF2A2A2A), const Color(0xFF1E1E1E)]
              : [Colors.white, const Color(0xFFF8F8F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.unityTeal.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.unityTeal.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // 상단: FunRun 로고
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FUNRUN',
                style: TextStyle(
                  color: AppColors.unityTeal,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'RUNNER ID',
                style: TextStyle(
                  color: AppColors.textSecondary(isDark),
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 프로필 사진
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.sparkOrange,
                  AppColors.sparkOrange.withOpacity(0.7),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.sparkOrange.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 50),
          ),
          const SizedBox(height: 16),

          // 닉네임
          Text(
            'Runner Kim',
            style: TextStyle(
              color: AppColors.textPrimary(isDark),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@runner_kim_2026',
            style: TextStyle(
              color: AppColors.textSecondary(isDark),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // 핵심 스탯 3개
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : AppColors.partnerLavender.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProfileStat('🏅', '152 km', 'Total'),
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.textSecondary(isDark).withOpacity(0.3),
                ),
                _buildProfileStat('🎯', 'Fun Run', 'Style'),
                Container(
                  height: 40,
                  width: 1,
                  color: AppColors.textSecondary(isDark).withOpacity(0.3),
                ),
                _buildProfileStat('⏱️', '6:30', 'Pace'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 11, color: AppColors.slateGray)),
      ],
    );
  }

  Widget _buildBadgeSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Badges',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBadge(
              isDark,
              '🏅',
              'Marathon\nFinisher',
              AppColors.sparkOrange,
            ),
            _buildBadge(isDark, '🌙', 'Night\nRunner', AppColors.unityTeal),
            _buildBadge(
              isDark,
              '🔥',
              '7-Day\nStreak',
              AppColors.luminousLime,
              darkText: true,
            ),
            _buildBadge(
              isDark,
              '⚡',
              'Speed\nDemon',
              AppColors.partnerLavender,
              darkText: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(
    bool isDark,
    String emoji,
    String label,
    Color color, {
    bool darkText = false,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 28)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary(isDark),
            fontSize: 10,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}

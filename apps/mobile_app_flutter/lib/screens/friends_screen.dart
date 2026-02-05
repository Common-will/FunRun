import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// 친구 & 커뮤니티 화면
class FriendsScreen extends StatelessWidget {
  final String userId;
  const FriendsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Friends & Community',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.person_add, color: AppColors.unityTeal),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 내 그룹
          _buildSectionTitle('My Groups', isDark),
          const SizedBox(height: 12),
          _buildGroupCard(
            isDark,
            '🏃 한강 러닝 크루',
            '15 members',
            '이번 주 토요일 7AM 정기런',
          ),
          const SizedBox(height: 12),
          _buildGroupCard(isDark, '🌙 야간 러너스', '8 members', '평일 저녁 9시 반포'),
          const SizedBox(height: 24),

          // 친구 목록
          _buildSectionTitle('Friends', isDark),
          const SizedBox(height: 12),
          _buildFriendCard(isDark, '김철수', '32.5 km this month', [
            '🏅',
            '🌙',
          ], hasUpcomingRun: true),
          _buildFriendCard(isDark, '이영희', '28.0 km this month', [
            '🔥',
            '⚡',
          ], hasUpcomingRun: false),
          _buildFriendCard(isDark, '박지민', '45.2 km this month', [
            '🏅',
            '🔥',
            '⚡',
          ], hasUpcomingRun: true),
          _buildFriendCard(isDark, '최수진', '18.7 km this month', [
            '🌙',
          ], hasUpcomingRun: false),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.textPrimary(isDark),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildGroupCard(
    bool isDark,
    String name,
    String members,
    String nextEvent,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.unityTeal.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.groups,
              color: AppColors.unityTeal,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.textPrimary(isDark),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  members,
                  style: TextStyle(
                    color: AppColors.textSecondary(isDark),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.partnerLavender.withOpacity(
                      isDark ? 0.3 : 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    nextEvent,
                    style: TextStyle(
                      color: isDark ? AppColors.mistWhite : AppColors.inkBlack,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textSecondary(isDark)),
        ],
      ),
    );
  }

  Widget _buildFriendCard(
    bool isDark,
    String name,
    String stats,
    List<String> badges, {
    required bool hasUpcomingRun,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: hasUpcomingRun
            ? Border.all(
                color: AppColors.sparkOrange.withOpacity(0.5),
                width: 1.5,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 프로필
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.unityTeal.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  color: AppColors.unityTeal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: AppColors.textPrimary(isDark),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (hasUpcomingRun) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.sparkOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'RUN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  stats,
                  style: TextStyle(
                    color: AppColors.textSecondary(isDark),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // 뱃지
          Row(
            children: badges
                .map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(b, style: const TextStyle(fontSize: 18)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

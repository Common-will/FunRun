import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// 뉴스 & 제안 화면 - 카드뉴스 형식
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'News & Suggestions',
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
          _buildNewsCard(
            isDark: isDark,
            title: '🏃 서울 마라톤 2026',
            subtitle: '3월 15일 개최 예정',
            description: '올해 가장 큰 마라톤 대회! 지금 바로 등록하세요.',
            tag: 'EVENT',
            tagColor: AppColors.sparkOrange,
          ),
          const SizedBox(height: 16),
          _buildNewsCard(
            isDark: isDark,
            title: '👟 Nike Pegasus 42 출시',
            subtitle: '새로운 러닝화 리뷰',
            description: '더 가벼워지고, 더 편안해진 페가수스 시리즈의 최신작.',
            tag: 'GEAR',
            tagColor: AppColors.unityTeal,
          ),
          const SizedBox(height: 16),
          _buildNewsCard(
            isDark: isDark,
            title: '💡 이번 주 추천 코스',
            subtitle: '한강 반포 구간',
            description: '야간 러닝에 최적화된 조명과 평탄한 노면.',
            tag: 'COURSE',
            tagColor: AppColors.partnerLavender,
            tagTextDark: true,
          ),
          const SizedBox(height: 16),
          _buildNewsCard(
            isDark: isDark,
            title: '🎧 러닝 플레이리스트',
            subtitle: 'Spotify 연동',
            description: '당신의 페이스에 맞는 BPM 음악을 자동 추천.',
            tag: 'TIP',
            tagColor: AppColors.luminousLime,
            tagTextDark: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard({
    required bool isDark,
    required String title,
    required String subtitle,
    required String description,
    required String tag,
    required Color tagColor,
    bool tagTextDark = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: tagTextDark ? AppColors.inkBlack : Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary(isDark),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: AppColors.textSecondary(isDark),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: AppColors.textSecondary(isDark),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

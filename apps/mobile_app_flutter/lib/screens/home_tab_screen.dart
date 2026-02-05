import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/cute_map_background.dart';
import 'profile_screen.dart'; // Full profile view

/// 홈 탭 화면 (Home Tab Screen)
///
/// 앱의 메인 화면으로, 다음 요소들로 구성된 Stack 구조를 가집니다:
/// 1. [CuteMapBackground]: 배경에 깔리는 파스텔톤 지도
/// 2. [MapMarkers]: 지도 위에 표시되는 마커들 (러닝, 친구 등)
/// 3. [MiniProfile]: 왼쪽 상단의 미니 프로필 카드 (터치 시 확장)
/// 4. [InfoOverlay]: 오른쪽 상단의 날씨 및 목표 정보 오버레이
class HomeTabScreen extends StatefulWidget {
  /// 현재 로그인한 사용자의 ID
  final String userId;

  const HomeTabScreen({super.key, required this.userId});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      body: Stack(
        children: [
          // 1. Layer: 지도 배경 (전체 화면)
          const Positioned.fill(child: CuteMapBackground()),

          // 2. Layer: 지도 위 마커들 (가짜 데이터)
          _buildMapMarkers(isDark),

          // 3. Layer: 상단 UI (프로필, 정보)
          Positioned(
            top: topPadding + 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 왼쪽: 미니 프로필 카드
                _buildMiniProfile(isDark),

                // 오른쪽: 정보 오버레이 (날씨 등)
                _buildInfoOverlay(isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapMarkers(bool isDark) {
    // 임시 마커들
    return Stack(
      children: [
        Positioned(
          top: 300,
          left: 150,
          child: _buildMarker(isDark, '🔥', 'Hot Run'),
        ),
        Positioned(
          top: 500,
          right: 50,
          child: _buildMarker(isDark, '⚡', 'Speed'),
        ),
        Positioned(
          bottom: 200,
          left: 50,
          child: _buildMarker(isDark, '👥', 'Crew'),
        ),
      ],
    );
  }

  Widget _buildMarker(bool isDark, String emoji, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(emoji, style: const TextStyle(fontSize: 24)),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  /// 미니 프로필 카드 (클릭 시 확장)
  Widget _buildMiniProfile(bool isDark) {
    return GestureDetector(
      onTap: () {
        // 프로필 팝업 보기
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                height: 500, // 높이 제한
                child: ProfileScreen(userId: widget.userId, isDialog: true),
              ),
            ),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF2A2A2A).withOpacity(0.9)
              : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 프로필 이미지
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.sparkOrange,
                    AppColors.sparkOrange.withOpacity(0.7),
                  ],
                ),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 8),
            // 정보
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Runner Kim',
                  style: TextStyle(
                    color: AppColors.textPrimary(isDark),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lv. 5',
                  style: TextStyle(
                    color: AppColors.textSecondary(isDark),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  /// 정보 오버레이 (날씨, 시간 등) - 투명 레이어
  Widget _buildInfoOverlay(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withOpacity(0.3)
            : Colors.white.withOpacity(0.3), // 반투명
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wb_sunny_rounded, color: Colors.orange, size: 16),
              SizedBox(width: 4),
              Text(
                '23°C Sunny',
                style: TextStyle(
                  color: Colors.black87, // 지도 위라 잘 보이게
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            'Running Good 👍',
            style: TextStyle(color: Colors.black54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

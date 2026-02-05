import 'package:flutter/material.dart';

/// 앱의 전체 색상 팔레트 클래스 (AppColors)
///
/// "Connected Runner" 테마를 정의하며, 라이트/다크 모드에 대응하는 메서드를 제공합니다.
/// 주요 색상 카테고리:
/// - **Base**: 배경색
/// - **Primary (협력)**: Unity Teal, Partner Lavender
/// - **Accent (에너지)**: Spark Orange, Luminous Lime
/// - **Neutral (위계)**: 텍스트 및 보조 색상
class AppColors {
  // ========== 배경 (Base Canvas) ==========
  static const Color solarWhite = Color(0xFFFAFAFA); // Day 배경
  static const Color midnightCarbon = Color(0xFF181818); // Night 배경

  // ========== 협력 (Cooperation - Primary) ==========
  static const Color unityTeal = Color(0xFF00897B); // 커뮤니티, 친구, 공유
  static const Color partnerLavender = Color(0xFFE1D4F9); // 친구 활동, 격려 메시지 배경

  // ========== 재미 & 에너지 (Fun & Energy - Accent) ==========
  static const Color sparkOrange = Color(0xFFFF6D00); // Run Start 버튼, 성취 배지
  static const Color luminousLime = Color(0xFFC6FF00); // 야간 하이라이트

  // ========== 정보 & 위계 (Neutral & Hierarchy) ==========
  // Light Mode
  static const Color inkBlack = Color(0xFF212121); // 주요 텍스트 (라이트)
  static const Color slateGray = Color(0xFF757575); // 보조 텍스트 (라이트)

  // Dark Mode
  static const Color mistWhite = Color(0xFFEDEDED); // 주요 텍스트 (다크)
  static const Color ashGray = Color(0xFF9E9E9E); // 보조 텍스트 (다크)

  // ========== 편의 메서드 ==========
  static Color background(bool isDark) => isDark ? midnightCarbon : solarWhite;
  static Color textPrimary(bool isDark) => isDark ? mistWhite : inkBlack;
  static Color textSecondary(bool isDark) => isDark ? ashGray : slateGray;
  static Color accent(bool isDark) => isDark ? luminousLime : sparkOrange;
}

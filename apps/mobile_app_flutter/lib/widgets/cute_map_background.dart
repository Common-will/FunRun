import 'package:flutter/material.dart';

/// 귀여운 지도 배경 위젯 (Cute Map Background)
///
/// Google Maps API 키 없이도 UI 테스트가 가능하도록,
/// `CustomPainter`를 사용하여 파스텔톤의 지도 배경을 직접 그립니다.
///
/// - 테마(라이트/다크)에 따라 색상이 자동으로 변경됩니다.
class CuteMapBackground extends StatelessWidget {
  const CuteMapBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomPaint(
      painter: MapPainter(isDark: isDark),
      size: Size.infinite,
    );
  }
}

/// 지도를 그리는 페인터 클래스
///
/// 캔버스에 땅, 물, 공원, 도로를 순서대로 그려서 지도를 시뮬레이션합니다.
class MapPainter extends CustomPainter {
  /// 다크 모드 여부
  final bool isDark;

  MapPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final bg = isDark
        ? const Color(0xFF2A2A2A)
        : const Color(0xFFFAF8EF); // 땅 색상 (따뜻한 베이지)
    final water = isDark
        ? const Color(0xFF1A3344)
        : const Color(0xFFD4F1F9); // 물 색상 (파스텔 블루)
    final park = isDark
        ? const Color(0xFF253829)
        : const Color(0xFFE3F2E1); // 공원 색상 (파스텔 그린)
    final road = isDark
        ? const Color(0xFF383838)
        : const Color(0xFFFFFFFF); // 도로 색상

    // 1. 배경 (땅)
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = bg,
    );

    // 2. 강/호수 그리기 (곡선)
    final waterPaint = Paint()
      ..color = water
      ..style = PaintingStyle.fill;
    final riverPath = Path();
    riverPath.moveTo(size.width * 0.8, 0);
    riverPath.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.3,
      size.width,
      size.height * 0.5,
    );
    riverPath.lineTo(size.width, 0);
    canvas.drawPath(riverPath, waterPaint);

    final pondPath = Path();
    pondPath.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.2, size.height * 0.7),
        width: 120,
        height: 80,
      ),
    );
    canvas.drawPath(pondPath, waterPaint);

    // 3. 공원 그리기 (둥근 형태)
    final parkPaint = Paint()
      ..color = park
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.8),
      100,
      parkPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.2),
      80,
      parkPaint,
    );

    // 4. 도로 그리기 (메인 도로 & 골목)
    final roadPaint = Paint()
      ..color = road
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // 메인 도로
    canvas.drawLine(
      Offset(0, size.height * 0.4),
      Offset(size.width, size.height * 0.5),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.4, 0),
      Offset(size.width * 0.5, size.height),
      roadPaint,
    );

    // 작은 도로
    roadPaint.strokeWidth = 6;
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.2),
      Offset(size.width, size.height * 0.2),
      roadPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.4, size.height * 0.8),
      roadPaint,
    );

    // 5. 건물/블록 (장식용)
    final buildingPaint = Paint()
      ..color = isDark ? const Color(0xFF404040) : const Color(0xFFF0EBE0);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, size.height * 0.45, 40, 40),
        const Radius.circular(8),
      ),
      buildingPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.6, size.height * 0.1, 50, 30),
        const Radius.circular(8),
      ),
      buildingPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

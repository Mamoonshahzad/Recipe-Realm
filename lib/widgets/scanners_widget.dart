import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerWidget extends StatelessWidget {
  final String scannerImage;

  final String scannerText;

  const ScannerWidget(
      {super.key, required this.scannerImage, required this.scannerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1)),
      width: Get.width,
      height: 130,
      child: Container(
        margin: const EdgeInsets.all(3),
        width: Get.width,
        height: 130,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(17)),
        child: Row(
          children: [
            const VerticalCurvedLine(),
            SizedBox(width: Get.width * .1),
            Text(scannerText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white)),
            SizedBox(width: Get.width * .05),
            Image.asset(
              scannerImage,
              color: Colors.white,
              width: 70,
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class VerticalCurvedLine extends StatelessWidget {
  const VerticalCurvedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 200),
      painter: VerticalCurvedLinePainter(),
    );
  }
}

class VerticalCurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    const double controlPointOffset = 30;
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(
      size.width / 2 + controlPointOffset,
      size.height / 2,
      size.width / 2,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

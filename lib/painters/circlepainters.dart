import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 90.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Icon(Icons.search),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height + 10);
    path.lineTo(size.width, size.height + 10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TopSliderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: _topSliderItemIcon(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nike',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Air Jordan Jumpman',
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  '75% off',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _topSliderItemIcon() {
    return Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: 160,
        height: 160,
        child: Stack(
          children: <Widget>[
            Center(
                child: ClipPath(
                    clipper: SlideImageContainerClipper(),
                    child: Container(
                      width: 100,
                      height: 140,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(0XFFd958da),
                            Colors.pink,
                          ])),
                    ))),
            Positioned(
              left: 20,
              top: -20,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/slide_foot.png'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideImageContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width + 10, 0);
    path.quadraticBezierTo(60, 17, 30, 10);
    path.quadraticBezierTo(30, 20, 0, 40);
    path.cubicTo(size.width / 2 - 10, size.height + 12, size.width,
        size.height + 40, size.width, 0);
    //  path.lineTo(0, size.height);
    //  path.lineTo(size.width, size.height);
    //  path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

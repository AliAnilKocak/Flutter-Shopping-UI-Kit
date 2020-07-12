import 'dart:ui';

class Luck {
  final String image;
  final Color color;
  final String point;

  Luck(this.image, this.color, this.point);

  String get asset => "assets/images/$image.png";
}

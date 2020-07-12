import 'package:flutter/material.dart';

class DottedSlider extends StatefulWidget {
  final Color color;
  final List<Widget> children;
  final double maxHeight;
  DottedSlider({Key key, this.color, this.children, this.maxHeight})
      : super(key: key);

  @override
  _DottedSliderState createState() => new _DottedSliderState();
}

class _DottedSliderState extends State<DottedSlider> {
  PageController controller = PageController();

  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: widget.maxHeight),
          child: PageView(
            controller: controller,
            children: widget.children,
          ),
        ),
        _drawDots(currentPage)
      ],
    );
  }

  _drawDots(page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < widget.children.length; i++) dot((page == i)),
      ],
    );
  }

  dot(bool selected) {
    double size = 6;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 2, left: 2, bottom: 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (selected) ? widget.color : Colors.black38),
      ),
    );
  }
}

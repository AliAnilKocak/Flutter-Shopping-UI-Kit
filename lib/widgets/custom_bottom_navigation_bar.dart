import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int selectedIndex;
  final Color selectedColor;
  final Color unselectedColor;
  CustomBottomNavigationBar(
      {Key key,
      this.items,
      this.onTap,
      this.selectedIndex,
      this.selectedColor = Colors.white54,
      this.unselectedColor = Colors.white})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      new _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(30)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0,
        color: Color(0XFF3399ff),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              for (var i = 0; i < widget.items.length; i++)
                _Tile(
                  index: i,
                  item: widget.items[i],
                  selected: i == selectedIndex,
                  selectedColor: widget.selectedColor,
                  unselectedColor: widget.unselectedColor,
                  onTap: (index) {
                    widget.onTap(index);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final CustomNavigationBarItem item;
  final int index;
  final Function(int) onTap;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;

  _Tile(
      {this.item,
      this.index,
      this.onTap,
      this.selected,
      this.selectedColor,
      this.unselectedColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(item.icon, color: selected ? selectedColor : unselectedColor),
            Text(
              item.title,
              style:
                  TextStyle(color: selected ? selectedColor : unselectedColor),
            ),
          ],
        ),
      ),
      onTap: () {
        onTap(index);
      },
    );
  }
}

class CustomNavigationBarItem {
  final String title;
  final IconData icon;
  CustomNavigationBarItem({this.title, this.icon});
}

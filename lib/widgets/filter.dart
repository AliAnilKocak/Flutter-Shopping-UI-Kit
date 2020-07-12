import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Filtre extends StatefulWidget {
  @override
  _FiltreState createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  double _lowerValue = 60;
  double _upperValue = 1000;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Reset"),
              Text("Filters"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              color: Colors.black26,
              height: 2,
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: <Widget>[
                buildChip("American", Colors.grey.shade400, "A",
                    Colors.grey.shade600),
                buildChip("Turkish", Theme.of(context).primaryColor, "A",
                    Theme.of(context).primaryColor),
                buildChip(
                    "Asia", Colors.grey.shade400, "A", Colors.grey.shade600),
                buildChip(
                    "Europe", Colors.grey.shade400, "A", Colors.grey.shade600),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              buildChip(
                  "Lorem", Colors.grey.shade400, "A", Colors.grey.shade600),
              buildChip(
                  "Ipsum", Colors.grey.shade400, "A", Colors.grey.shade600),
              buildChip(
                  "Dolır", Colors.grey.shade400, "A", Colors.grey.shade600),
              buildChip(
                  "Sit amed", Colors.grey.shade400, "A", Colors.grey.shade600),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("SORT BY"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Top Rated",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Divider(
              color: Colors.black26,
              height: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nearest Me"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Divider(
              color: Colors.black26,
              height: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cost Hight to Low"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Divider(
              color: Colors.black26,
              height: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cost Low to Hight"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Divider(
              color: Colors.black26,
              height: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: Text("PRICE"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("\$ " + '$_lowerValue'),
                Text("\$ " + '$_upperValue'),
              ],
            ),
          ),
          FlutterSlider(
            tooltip: FlutterSliderTooltip(
              leftPrefix: Icon(
                Icons.attach_money,
                size: 19,
                color: Colors.black45,
              ),
              rightSuffix: Icon(
                Icons.attach_money,
                size: 19,
                color: Colors.black45,
              ),
            ),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
                border: Border.all(width: 3, color: Colors.blue),
              ),
              activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.red.withOpacity(0.5)),
            ),
            values: [30, 420],
            rangeSlider: true,
            max: 500,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Padding buildChip(
      String label, Color color, String avatarTitle, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, right: 2.0, left: 2.0),
      child: FilterChip(
        padding: EdgeInsets.all(4.0),
        label: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(color: color),
        ),
        onSelected: (bool value) {
          print("selected");
        },
      ),
    );
  }
}

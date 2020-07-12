import 'package:flutter/material.dart';

class GreatDealItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0XFF72e1ba),
                  Color(0XFFfefeff),
                ],
                    stops: [
                  0.0,
                  0.8
                ])),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.landscape),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Explore the wide range of',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        Text(
                          'UNDER ARMOUR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        Text('Collections'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.black,
                          padding: EdgeInsets.only(
                              left: 7.0, right: 7.0, top: 2.0, bottom: 2.0),
                          child: Text(
                            'shop now',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: -32,
            top: -10,
            child: Image.asset(
              'assets/great_foot.png',
              width: 310,
              height: 150,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

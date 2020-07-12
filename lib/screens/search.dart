import 'package:flutter/material.dart';
import 'package:fluttercommerce/utils/constant.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 45.0,
          left: 24.0,
          right: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter a product name eg. pension',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Color(0xFFEEEEEE),
                  prefixIcon: Icon(
                    Icons.mic,
                    color: Colors.blueGrey[200],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: imgList.length,
                itemBuilder: (context, pos) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      height: 148,
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    imgList[pos],
                                  ),
                                ),
                              ),
                              height: 350.0,
                            ),
                            Container(
                              height: 350.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.black26,
                                        Colors.black26,
                                      ],
                                      stops: [
                                        0.0,
                                        1.0
                                      ])),
                            ),
                            Center(
                              child: Text(
                                "Kampanya",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

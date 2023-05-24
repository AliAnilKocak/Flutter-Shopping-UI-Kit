import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SocialBottomSheet extends StatelessWidget {
  const SocialBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 12),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        height: 160,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                " -----  Sign with  -----",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesome.getIconData("facebook"),
                          color: Color(0xFF3b5998),
                        )),
                    Text("Facebook")
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesome.getIconData("google"),
                            color: Color(0xFFdd4b39))),
                    Text("Google")
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesome.getIconData("twitter"),
                            color: Color(0xFF00aced))),
                    Text("Twitter")
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

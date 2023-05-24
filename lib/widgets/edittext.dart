import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditText extends StatelessWidget {
  String title;
  EditText({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 24.0, right: 24.0),
        child: TextField(
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Theme.of(context).dividerColor,
            hintText: title,
            hintStyle: Theme.of(context).textTheme.headline5,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CodeInputBuilder = Widget Function(bool hasFocus, String char);

class CodeInput extends StatefulWidget {
  CodeInput._({
    Key key,
    @required this.length,
    @required this.focusNode,
    @required this.keyboardType,
    @required this.inputFormatters,
    @required this.builder,
    this.onChanged,
    this.onFilled,
  }) : super(key: key);

  factory CodeInput({
    Key key,
    @required int length,
    FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter> inputFormatters,
    @required CodeInputBuilder builder,
    void Function(String value) onChanged,
    void Function(String value) onFilled,
  }) {
    assert(length != null);
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');
    assert(keyboardType != null);
    assert(builder != null,
        'The builder is required for rendering the character segments.');

    return CodeInput._(
      key: key,
      length: length,
      focusNode: focusNode ?? FocusNode(),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? _createInputFormatters(length, keyboardType),
      builder: builder,
      onChanged: onChanged,
      onFilled: onFilled,
    );
  }

  final int length;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter> inputFormatters;

  final CodeInputBuilder builder;

  final void Function(String value) onChanged;

  final void Function(String value) onFilled;

  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)
    ];

    if (keyboardType == TextInputType.number) {
      formatters.add(WhitelistingTextInputFormatter(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  final controller = TextEditingController();

  String get text => controller.text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
            controller: controller,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: Colors.black,
            style: TextStyle(),
            cursorColor: Colors.black,
            onChanged: (value) => setState(() {
              widget.onChanged?.call(value);
              if (value.length == widget.length) {
                widget.onFilled?.call(value);
              }
            }),
          )),
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
              Duration.zero,
              () => focusScope.requestFocus(widget.focusNode),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.length, (i) {
                final hasFocus = controller.selection.start == i;
                final char = i < text.length ? text[i] : '';
                final characterEntity = widget.builder(hasFocus, char);

                assert(
                    characterEntity != null,
                    'The builder for the character entity at position $i '
                    'returned null. It did${hasFocus ? ' not' : ''} have the '
                    'focus and the character passed to it was \'$char\'.');

                return characterEntity;
              }),
            ),
          )),
    ]);
  }
}

abstract class CodeInputBuilders {
  static CodeInputBuilder containerized({
    Duration animationDuration = const Duration(milliseconds: 50),
    @required Size totalSize,
    @required Size emptySize,
    @required Size filledSize,
    @required BoxDecoration emptyDecoration,
    @required BoxDecoration filledDecoration,
    @required TextStyle emptyTextStyle,
    @required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: char.isEmpty ? emptyDecoration : filledDecoration,
          width: char.isEmpty ? emptySize.width : filledSize.width,
          height: char.isEmpty ? emptySize.height : filledSize.height,
          alignment: Alignment.center,
          child: Text(char,
              style: char.isEmpty ? emptyTextStyle : filledTextStyle),
        ));
  }

  static CodeInputBuilder circle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0,
      @required Border border,
      @required Color color,
      @required TextStyle textStyle}) {
    final decoration = BoxDecoration(
      shape: BoxShape.circle,
      border: border,
      color: color,
    );

    return containerized(
        totalSize: Size.fromRadius(totalRadius),
        emptySize: Size.fromRadius(emptyRadius),
        filledSize: Size.fromRadius(filledRadius),
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  static CodeInputBuilder darkCircle({
    double totalRadius = 35.0,
    double emptyRadius = 25.0,
    double filledRadius = 30.0,
  }) {
    return circle(
      totalRadius: totalRadius,
      emptyRadius: emptyRadius,
      filledRadius: filledRadius,
      color: Color(0xFFF93963),
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      border: null,
    );
  }
}

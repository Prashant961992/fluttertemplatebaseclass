import 'package:flutter/material.dart';

class CustomRaisedButton extends StatefulWidget {
  final String text;
  final Color buttonColor;
  final Color disabledButtonColor;
  final Color disabledTextColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final Function onCustomButtonPressed;
  final BuildContext context;
  final double padding = 8.0;

  CustomRaisedButton(
      {this.text,
      this.buttonColor,
      this.disabledButtonColor,
      this.disabledTextColor,
      this.borderRadius,
      this.fontSize,
      this.textColor,
      this.onCustomButtonPressed,
      this.context});

  @override
  _CustomRaisedButton createState() => new _CustomRaisedButton();
}

class _CustomRaisedButton extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: (widget.buttonColor ?? Colors.blue).withOpacity(.8),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * .70,
      child: RaisedButton(
        disabledColor: widget.disabledButtonColor ?? Colors.grey,
        disabledTextColor: widget.disabledTextColor ?? Colors.black,
        color: widget.buttonColor ?? Colors.blue,
        onPressed: widget.onCustomButtonPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: new TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontSize,
//          fontFamily: 'Roboto',
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(widget.borderRadius ?? 30),
        ),
        padding: EdgeInsets.all(widget.padding),
      ),
    );
  }
}

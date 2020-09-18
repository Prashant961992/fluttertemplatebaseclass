import 'package:flutter/material.dart';

class CustomAppBarIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CustomAppBarIconButton({
    this.icon,
    this.onPressed,
  });
  
  @override
  _CustomAppBarIconButtonState createState() => _CustomAppBarIconButtonState();
}

class _CustomAppBarIconButtonState extends State<CustomAppBarIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          icon: Icon(widget.icon),
          color: Colors.black,
          onPressed: widget.onPressed,
          iconSize: 25,
        )
    );
  }
}
import 'package:flutter/material.dart';
import '../index.dart';

class CustomCard extends StatefulWidget {
  final IconData icon;
  final String dataText;
  final String dataValue;

  CustomCard({
    this.icon,
    this.dataText,
    this.dataValue,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 3,
      ),
      child: Card(
        color: white,
        shadowColor: black,
        elevation: 10,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                widget.icon,
                size: 45,
                color: cardIcon,
              ),
            ),
            Container(
              padding: EdgeInsets.all(9),
              width: 100,
              child: Text(
                widget.dataText ?? '',
                style: cardTextStyle(),
              ),
            ),
            Expanded(
              child: Text(
                widget.dataValue ?? '',
                style: cardTextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

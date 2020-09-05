import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  int row;
  int column;
  bool isOccupied = false;
  Piece type;
  Color color;

  Square(columnName, rowName, occupied, pieceType, color) {
    this.column = columnName;
    this.row = rowName;
    this.isOccupied = occupied;
    this.type = pieceType;
    this.color = color;
  }

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  bool changeOccupy() {
    widget.isOccupied = !widget.isOccupied;
    return widget.isOccupied;
  }

  bool get occupied {
    return widget.isOccupied;
  }

  String get name {
    return " Col: ${widget.column} Row: ${widget.row}";
  }

  @override
  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width * 0.1;
    return Container(
        color: widget.color,
        height: heightt,
        width: width,
        child: Text(name));
  }
}

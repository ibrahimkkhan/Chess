import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/piece.dart';
import 'package:flutter/material.dart';

import 'board.dart';



class Square extends StatefulWidget {
  final SquareController controller;

  int row;
  int column;
  bool isOccupied = false;
  Piece type;
  Color color;
  

  Square({columnName, rowName, occupied, pieceType, color, this.controller}) {
    this.column = columnName;
    this.row = rowName;
    this.isOccupied = occupied;
    this.type = pieceType;
    this.color = color;
  }

  String get name {
    return "Col: ${this.column} Row: ${this.row}";
  }

  @override
  SquareState createState() => SquareState(controller);
}

class SquareState extends State<Square> {
   SquareState(SquareController _controller) {
    _controller.changeOccupy = changeOccupy;
  }

  void changeOccupy(Piece piece) {
    setState(() {
      // print(widget.column.toString() + widget.row.toString() + piece.getLocation.toString());
      widget.isOccupied = !widget.isOccupied;
      widget.type = piece;
      print(widget.type.getLocation);
    });
    
    
    // if (piece == null){

    // }else{

    // }
  }

  bool get occupied {
    return widget.isOccupied;
  }

  

  @override
  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width * 0.1;
    return GestureDetector(
        onDoubleTap: () {
          
        },
        child: Container(
            color: widget.color,
            height: heightt,
            width: width,
            child: (widget.type == null)
                ? Text(widget.name)
                : Text(widget.name + widget.type.getName)));
  }
}


import 'package:flutter/material.dart';



class Square extends StatefulWidget {

    int row;
    String column;
    bool isOccupied = false;
    var type;

    Square(columnName, rowName, occupied, pieceType){
      this.column = columnName;
      this.row = rowName;
      this.isOccupied = occupied;
      this.type = pieceType;
    }

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
    bool moveTo(){
      widget.isOccupied = !widget.isOccupied;
      return widget.isOccupied;
    }


    bool get occupied{
      return widget.isOccupied;
    }

    String get name{
      return "${widget.row} + ${widget.column}";
    }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width * 0.1;
    return Container(
      color: widget.isOccupied == true?Colors.green:Colors.yellow,
      height: height,
      width: width,
      child: widget.type.toString() == "PieceType.Pawn"?Center(child: (Text("Pawn"))):Center(child: Text("NO"))
      );
  }
}
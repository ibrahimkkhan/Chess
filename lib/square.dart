
import 'package:flutter/material.dart';

class Square extends StatefulWidget {

    String squareName;
    bool isOccupied = false;

    Square(name, occupied){
      this.squareName = name;
      this.isOccupied = occupied;
    }

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
    bool moveTo(){
      widget.isOccupied = !widget.isOccupied;
      return widget.isOccupied;
    }

    String get name{
      return widget.squareName;
    }

    bool get occupied{
      return widget.isOccupied;
    }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width * 0.1;
    return Container(
      color: widget.isOccupied == true?Colors.green:Colors.yellow,
      height: height,
      width: width,
      child:Center(child:Text(widget.squareName)));
  }
}
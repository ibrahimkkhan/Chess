import 'package:chess/square.dart';
import 'package:flutter/material.dart';

class Pawn extends StatelessWidget {

  final columns = ["a","b","c","d","e","f","g","h"];

  Square _currentSquare;
  bool _firstMove = false;
  List<String> _validSquares;

  Pawn(Square _current){
    this._currentSquare = _current;
  }

  void _makeFirstMove(){
    this._firstMove = true;
  }
  
  List<String> findValidMoves(){
    _validSquares = [];
    if (_currentSquare.row != 8){
      String validMove = "${_currentSquare.column} + ${_currentSquare.row + 1}";
      print(validMove);
      _validSquares.add(validMove);
    }
    return _validSquares;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Pawn"),
    );
  }
}
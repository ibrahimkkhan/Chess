 import 'package:chess/pieces/pawn.dart';
import 'package:chess/square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PieceType {Pawn}
class Board extends StatefulWidget{
  
  
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final columns = ["a","b","c","d","e","f","g","h"];

  final List<Widget> board = [];
  final Map<Widget, bool> pieces = {};
  bool newGame = false;

  

  _createBoard(){
    for(int i = 7 ; i >= 0 ; i--) { 
      for(int j = 0 ; j < 8; j++) {
        if ((i + 1) < 3 || (i + 1) > 6){
          if ((i + 1) == 2 || (i + 1) == 7){
            Square square = new Square("${columns[j]}", i + 1, true, PieceType.Pawn);
            board.add(square);
          }else{
            Square square = new Square("${columns[j]}", i + 1, true, null);
            board.add(square);
          }        
        }else{
          Square square = new Square("${columns[j]}", i + 1, false, null);
          board.add(square);
          debugPrint("${square.column} + ${square.row.toString()} + ${square.isOccupied}");
        }
      }
    }
  }

  Widget boardLayout(){
    
    return GridView.count(crossAxisCount: 8,children: board,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        body: newGame == false?Center(child: RaisedButton(onPressed: () {
            _createBoard(); 
            setState(() {
              newGame = true;
            });         
        },),):boardLayout()
      ),
    );
  }
}
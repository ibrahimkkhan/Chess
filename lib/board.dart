 import 'package:chess/square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class Board extends StatefulWidget{
  
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final columns = ["a","b","c","d","e","f","g","h"];

  final List<Widget> board = [];
  bool newGame = false;

  _createBoard(){
    for(int i = 7 ; i >= 0 ; i--) { 
      for(int j = 0 ; j < 8; j++) {
        if ((i + 1) < 3 || (i + 1) > 6){
          Square square = new Square("${columns[j]}${i+1}", true);
          board.add(square);
          debugPrint("${square.squareName} + ${square.isOccupied}");
        }else{
          String name = "${columns[j]}${i+1}";
          Square square = new Square(name, false);
          board.add(square);
          debugPrint("${square.squareName} + ${square.isOccupied}");
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
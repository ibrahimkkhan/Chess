
import 'package:chess/pieces/piece.dart';
import 'package:chess/square.dart';
import 'package:flutter/material.dart';

class Pawn extends Piece {
  Map<String, int> location = new Map<String, int>();

  List<List<int>> getMoves;


  Pawn(column, row){
    location.putIfAbsent("col", () => column);
    location.putIfAbsent("row", () => row);
  }

  bool _madeFirstMove = false;

  get getName => "pawn";

  madeFirstMove(){
    _madeFirstMove = true;
  }

  List<String> getValidMoves(){
    List<String> tempList = [];
    


    if (!_madeFirstMove){
      for (int i = 1; i <= 2; i++ ){
        String temp = "";
        int row = location["row"] + i;
        int col = location["col"];
        temp += col.toString() + "," + row.toString();
        tempList.add(temp);
        _madeFirstMove = true;
      }
    }else{
      String temp = "";
      int row = location["row"] + 1;
      int col = location["col"];
      temp += col.toString() + "," + row.toString();
      tempList.add(temp);
    }
    
    // print(location.toString());
    // List<String> tempList = [];
    // String tempSquare = "";
    // tempSquare += location["col"].toString();
    // location["row"] = location["row"] + 1;
    // tempSquare += " ";
    // tempSquare += location["row"].toString();
    // tempList.add(tempSquare);
    print(tempList.toString());
    return tempList;
  }



  // Map<String, int> makeMove() {
  //   location.update('row', (value) => value + 1);
  //   // location.update('col', (value) => value + 1);
  //   return this.location;
  // }
}

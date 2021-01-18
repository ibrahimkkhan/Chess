import 'package:chess/pieces/piece.dart';
import 'package:chess/square.dart';
import 'package:flutter/material.dart';

import '../board.dart';

class Pawn extends Piece {
  Map<String, int> location = new Map<String, int>();
  int column;
  int row;

  List<Square> getMoves = [];

  Color color;

  Pawn(column, row, Color color) {
    this.column = column;
    this.row = row;
    location.putIfAbsent("col", () => column);
    location.putIfAbsent("row", () => row);
    this.color = color;
  }

  // get getLocation => this.location;

  bool _madeFirstMove = false;

  get getLocation => this.location;
  get getColor => this.color;

  get getName => "Pawn";

  List<String> getValidMoves(List<List<Square>> currentBoard) {
    List<String> validMoves = [];
    if (this.color == Colors.white) {
      // to be re written (.elementAt(Row).elementAt(col))
      if ((this.row - 1) > 0) {
        
        if ((this.column + 1) < 8) {
          
            currentBoard
                .elementAt(this.column + 1)
                .elementAt(this.row - 1);
            //  print ("cCol " + currentBoard
            //     .elementAt(this.column - 1)
            //     .elementAt(this.row -1).column.toString() + " Row " + currentBoard
            //     .elementAt(this.column - 1)
            //     .elementAt(this.row -1).row.toString() );
            print(this.location);     
          // print("Col: " + (this.column + 1).toString() + " Row: " + (this.row + 1).toString());
          int col = this.column + 1;
          int row = this.row - 1;
          validMoves.add("col " + col.toString() + " row " + row.toString());
        }
        if ((this.column - 1) >= 0) {
         
            int col = this.column - 1;
            int row = this.row - 1;
            validMoves.add("col " + col.toString() + " row " + row.toString());
          
        }
        int row = this.row - 1;
        validMoves
            .add("col " + this.column.toString() + " row " + row.toString());
        if (_madeFirstMove == false){
          int row = this.row - 2;
          validMoves
            .add("col " + this.column.toString() + " row " + row.toString());
        }
      }
    }
    print(validMoves);
    
    return validMoves;
  }

  @override
  Map<String, int> updateLocation(int colNew, int rowNew) {
    this.column = colNew;
    this.row = rowNew;
    location.update("col", (val) => column);
    location.update("row", (val) => row);
    print(location.toString());
    return location;
  }

  // List<String> getValidMoves() {
  //   List<String> tempList = [];
  //   String temp = "";
  //   int row = location["row"] + 1;
  //   int col = location["col"];

  //   temp += "Col: ${col.toString()} Row: ${row.toString()}";
  //   tempList.add(temp);
  //   temp = "";

  //   if (!_madeFirstMove) {
  //     temp += "Col: ${col.toString()} Row: ${(row + 1).toString()}";
  //     tempList.add(temp);
  //   }
// }
//     if (!_madeFirstMove){

//       for (int i = 1; i <= 2; i++ ){
//         String temp = "";
//         int row = location["row"] + i;
//         int col = location["col"];
//         temp += col.toString() + "," + row.toString();
//         tempList.add(temp);
//         _madeFirstMove = true;
//       }
//     }else{
//       String temp = "";
//       int row = location["row"] + 1;
//       int col = location["col"];
//       temp += col.toString() + "," + row.toString();
//       tempList.add(temp);
//     }

  // print(location.toString());
  // List<String> tempList = [];
  // String tempSquare = "";
  // tempSquare += location["col"].toString();
  // location["row"] = location["row"] + 1;
  // tempSquare += " ";
  // tempSquare += location["row"].toString();
  //   // tempList.add(tempSquare);
  //   print(tempList.toString());
  //   return tempList;
  // }

  // Map<String, int> makeMove() {
  //   location.update('row', (value) => value + 1);
  //   // location.update('col', (value) => value + 1);
  //   return this.location;
  // }
}

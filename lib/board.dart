import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/piece.dart';
import 'package:chess/square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  // final columns = ["a", "b", "c", "d", "e", "f", "g", "h"];
  // Map<Square,Piece> board;

  List<List<Square>> board = new List<List<Square>>();
  // board.add(row);

  // var board = List.generate(8, (i) => List(8), growable: false);

  bool newGame = false;
  List<Square> print = [];

  _createBoard() {
    for (int row = 1; row <= 8; row++) {
      List<Square> tempList = new List<Square>();
      for (int col = 1; col <= 8; col++) {
        bool check = false;
        var temp;
        if (row == 2 || row == 7){
        
          row == 2 ? temp = Pawn(col, row, Colors.black):temp = Pawn(col, row, Colors.white);
          check = true;
        }
        Square tempSquare = new Square(col, row, false, check?temp:null,
            (row + col) % 2 == 0 ? Colors.blue : Colors.pink);
        tempList.add(tempSquare);
        print.add(tempSquare);
      }
      board.add(tempList);
    }

    // for (int i = 7; i >= 0; i--) {
    //   for (int j = 0; j < 8; j++) {
    //     if ((i + 1) < 3 || (i + 1) > 6) {
    //       if ((i + 1) == 2 || (i + 1) == 7) {
    //         Pawn pawn = new Pawn(j + 1, i + 1);
    //         Square square = new Square(j + 1, i + 1, true, pawn);
    //         board.add(square);
    //       } else {
    //         Square square = new Square(j + 1, i + 1, false, null);
    //         board.add(square);
    //       }
    //     } else {
    //       Square square = new Square(j + 1, i + 1, false, null);
    //       board.add(square);
    //       debugPrint(
    //           "${square.column} + ${square.row.toString()} + ${square.isOccupied}");
    //     }
    //   }
    // }
  }

  // _updateBoard() {
  //   print(board);
  // }

  Widget boardLayout() {
    return GridView.count(
      crossAxisCount: 8,
      children: print,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: newGame == false
            ? Center(
                child: RaisedButton(
                  child: Text("New Game"),
                  onPressed: () {
                    _createBoard();
                    setState(() {
                      newGame = true;
                    });
                  },
                ),
              )
            : boardLayout(),
      ),
    );
  }
}

import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/piece.dart';
import 'package:chess/player/player.dart';
import 'package:chess/square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareController {
  int col;
  int row;
  SquareController(this.col, this.row);
  void Function(Piece piece) changeOccupy;
}

class Board extends StatefulWidget {
  List<List<SquareController>> mycontrollers = [];

  List<List<Square>> board = [];
  // board.add(row);

  // var board = List.generate(8, (i) => List(8), growable: false);

  bool newGame = false;
  bool boardCreated = false;
  List<Square> print = [];
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  // final columns = ["a", "b", "c", "d", "e", "f", "g", "h"];
  // Map<Square,Piece> board;

  // final SquareController myController = SquareController();

  _addPlayer1Pieces() {
    print("ENTRED");
    Player player1 = Player(name: "Player 1", color: Colors.white);
    player1.addPieces();

    for (int i = 0; i < 8; i++) {
      player1.pieces.elementAt(i).updateLocation(
          widget.board.elementAt(6).elementAt(i).column,
          widget.board.elementAt(6).elementAt(i).row);
      // player1.pieces.elementAt(i).location.update("col", (value) => );
      // player1.pieces.elementAt(i).location.update("row", (value) => );
      // print(player1.pieces.elementAt(i).location.toString());

      widget.mycontrollers
          .elementAt(6)
          .elementAt(i)
          .changeOccupy(player1.pieces.elementAt(i));
      // board.elementAt(6).elementAt(i)
    }
    // board.elementAt(6).forEach((square) {
    //   print("Col" + square.column.toString()+ "Row" + square.row.toString());
    //   player1.pieces.forEach((piece) {

    // myController.changeOccupy(piece);
    //   });
    // });
    for (int i = 0; i < 8; i++){
      for (int j = 0; j < 8; j++){
        var tobe = widget.board.elementAt(i).elementAt(j);
        print("Col " + tobe.column.toString() + " Row " + tobe.row.toString() + tobe.isOccupied.toString());
      }
    }
    // board.elementAt(6).forEach((square) {
    //   print(square.type.getLocation);
    // });
  }

  _createBoard() {
    widget.boardCreated = true;
    for (int row = 0; row < 8; row++) {
      List<Square> rowSquares = [];
      List<SquareController> rowSquaresControllers = [];
      for (int col = 0; col < 8; col++) {
        SquareController myController = SquareController(col, row);
        rowSquaresControllers.add(myController);
        Square tempSquare = new Square(
          pieceType: null,
          columnName: col,
          rowName: row,
          color: (row + col) % 2 == 0 ? Colors.blue : Colors.pink,
          occupied: false,
          controller: myController,
        );
        rowSquares.add(tempSquare);
        widget.print.add(tempSquare);
      }
      widget.mycontrollers.add(rowSquaresControllers);
      widget.board.add(rowSquares);
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
    // if (boardCreated == false) {
    widget.print = [];
    widget.board = [];
    _createBoard();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.board.length,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: GridTile(
            child: widget.board
                .elementAt((index / 8).floor())
                .elementAt(index % 8),
          ),
          onTap: () {
            widget.board
                        .elementAt((index / 8).floor())
                        .elementAt(index % 8)
                        .type ==
                    null
                ? null
                : widget.board
                        .elementAt((index / 8).floor())
                        .elementAt(index % 8)
                        .type.getValidMoves(widget.board);
          },
        );
      },
      itemCount: widget.board.length * widget.board.length,
    );
    // widget.board
    // return GridView.count(
    //   crossAxisCount: 8,
    //   children: widget.print,
    // );
    //}
    // else {
    //   return Text("Already Made");
    // }

    // return GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), itemBuilder: (context,index){
    //   var row =board.elementAt(index);

    // },);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _addPlayer1Pieces,
        ),
        body: boardLayout(),
        // body: ListView(
        //   children: [
        //     boardCreated == false ? boardLayout() : null,
        //     Row(children: [RaisedButton(onPressed: _addPlayer1Pieces),RaisedButton(onPressed:_addPlayer1Pieces)],)

        //   ],
        // ),
      ),
    );
  }
}

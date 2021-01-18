import 'dart:ui';

import 'package:chess/pieces/pawn.dart';
import 'package:chess/pieces/piece.dart';

class Player{

  final String name;
  final Color color;
  List<Piece> pieces = [];

  Player({this.name,this.color});

  addPieces(){
    for (int i = 1; i <= 8; i++){
      Pawn tempPawn = Pawn(null, null, this.color);
      pieces.add(tempPawn);
    }
  }

}
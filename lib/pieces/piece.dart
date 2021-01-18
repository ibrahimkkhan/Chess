import 'dart:ui';

import '../board.dart';
import '../square.dart';

abstract class Piece{

  Color color;

  Color get getColor;

  Map<String, int> get getLocation;

  Map<String, int> updateLocation(int colNew, int rowNew);

  bool alive = true;

  String get getName;

  Map<String, int> location;

  List<String> getValidMoves(List<List<Square>> board);
}
import 'dart:ui';

import '../square.dart';

abstract class  Piece{

  Color color;

  Color get getColor;

  bool alive = true;

  String get getName;

  Map<String, int> location;

  List<String> getValidMoves();
}
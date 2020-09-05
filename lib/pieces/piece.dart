import '../square.dart';

abstract class  Piece{

  bool alive = true;

  String get getName;

  Map<String, int> location;

  List<String> getValidMoves();
}
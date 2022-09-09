import 'dart:io';
import 'package:collection/collection.dart';

int mapFuncOne(String line) {
  var parts = line.split('x').map(int.parse).toList();
  var length = parts.first;
  var width = parts[1];
  var height = parts.last;
  var firstSide = length * width;
  var secondSide = width * height;
  var thirdSide = height * length;
  var allSides = [firstSide, secondSide, thirdSide];
  return allSides.map((e) => 2 * e).sum + allSides.min;
}

int partOne(String inp) {
  return inp.split('\n').map(mapFuncOne).sum;
}

int mapFuncTwo(String line) {
  var parts = line.split('x').map(int.parse).toList();
  var length = parts.first;
  var width = parts[1];
  var height = parts.last;
  parts.sort();
  return (2 * parts.first + 2 * parts[1]) + (length * width * height);
}

int partTwo(String inp) {
  return inp.split('\n').map(mapFuncTwo).sum;
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

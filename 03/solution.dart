import 'dart:io';

import 'package:tuple/tuple.dart';

int partOne(String inp) {
  var directions = inp.split('');
  var xPos = 0;
  var yPos = 0;
  Set<Tuple2<int, int>> delivered = Set.from([Tuple2(0, 0)]);
  for (var direction in directions) {
    if (direction == '<') {
      xPos--;
    } else if (direction == '^') {
      yPos++;
    } else if (direction == '>') {
      xPos++;
    } else {
      yPos--;
    }
    delivered.add(Tuple2(xPos, yPos));
  }
  return delivered.length;
}

int partTwo(String inp) {
  var directions = inp.split('');
  var positions = [
    [0, 0],
    [0, 0],
  ];
  var delivered = [
    Set.from([Tuple2(0, 0)]),
    Set.from([Tuple2(0, 0)]),
  ];
  for (var i = 0; i < directions.length; i++) {
    var direction = directions[i];
    if (direction == '<') {
      positions[i % 2][0]--;
    } else if (direction == '^') {
      positions[i % 2][1]++;
    } else if (direction == '>') {
      positions[i % 2][0]++;
    } else {
      positions[i % 2][1]--;
    }
    delivered[i % 2].add(Tuple2.fromList(positions[i % 2]));
  }
  return delivered.first.union(delivered.last).length;
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

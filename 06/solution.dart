import 'dart:io';
import 'dart:math';
import 'package:collection/collection.dart';

int partOne(String inp) {
  List<List<bool>> grid = List.generate(
    1000,
    (index) => List.generate(
      1000,
      (index) => false,
    ),
  );

  var actions = {
    'turn on': ((bool x) => true),
    'turn off': ((bool x) => false),
    'toggle': ((bool x) => !x),
  };
  var rx = RegExp(r'(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)');
  var matches = rx.allMatches(inp);
  for (var match in matches) {
    var action = match.group(1);
    var indices = match.groups([2, 3, 4, 5]).map(int.parse).toList();
    for (var i = indices[0]; i <= indices[2]; i++) {
      for (var j = indices[1]; j <= indices[3]; j++) {
        grid[i][j] = actions[action](grid[i][j]);
      }
    }
  }

  return grid.map((row) => row.map((e) => e ? 1 : 0).sum).sum;
}

int partTwo(String inp) {
  List<List<int>> grid = List.generate(
    1000,
    (index) => List.generate(
      1000,
      (index) => 0,
    ),
  );

  var actions = {
    'turn on': ((int x) => x + 1),
    'turn off': ((int x) => max(x - 1, 0)),
    'toggle': ((int x) => x + 2),
  };
  var rx = RegExp(r'(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)');
  var matches = rx.allMatches(inp);
  for (var match in matches) {
    var action = match.group(1);
    var indices = match.groups([2, 3, 4, 5]).map(int.parse).toList();
    for (var i = indices[0]; i <= indices[2]; i++) {
      for (var j = indices[1]; j <= indices[3]; j++) {
        grid[i][j] = actions[action](grid[i][j]);
      }
    }
  }

  return grid.map((row) => row.sum).sum;
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

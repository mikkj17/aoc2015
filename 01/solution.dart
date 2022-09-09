import 'dart:io';

int partOne(String inp) {
  var floor = 0;
  inp.runes.forEach((c) {
    var char = String.fromCharCode(c);
    floor = char == '(' ? floor + 1 : floor - 1;
  });
  return floor;
}

int partTwo(String inp) {
  var floor = 0;
  var position = 0;
  var characters = inp.split('');
  for (var char in characters) {
    position++;
    floor = char == '(' ? floor + 1 : floor - 1;
    if (floor == -1) {
      break;
    }
  }
  return position;
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

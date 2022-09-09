import 'dart:io';
import 'package:crypto/crypto.dart';

int helper(String inp, int nZeros) {
  var i = 0;
  while (true) {
    var digest = md5.convert('$inp$i'.runes.toList());
    if (digest.toString().startsWith('0' * nZeros)) {
      return i;
    }
    i++;
  }
}

int partOne(String inp) {
  return helper(inp, 5);
}

int partTwo(String inp) {
  return helper(inp, 6);
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

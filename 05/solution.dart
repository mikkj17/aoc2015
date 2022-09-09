import 'dart:io';

bool isNice(String str) {
  var vowels = str.split('').where((element) => 'aeiou'.contains(element));
  if (vowels.length < 3) {
    return false;
  }
  if (!str.contains(RegExp(r'(\w)\1'))) {
    return false;
  }
  for (var bad in ['ab', 'cd', 'pq', 'xy']) {
    if (str.contains(bad)) {
      return false;
    }
  }
  return true;
}

int partOne(String inp) {
  return inp.split('\n').where(isNice).length;
}

bool betterIsNice(String str) {
  if (!str.contains(RegExp(r'(\w\w)\w*\1'))) {
    return false;
  }
  if (!str.contains(RegExp(r'(\w)\w\1'))) {
    return false;
  }
  return true;
}

int partTwo(String inp) {
  return inp.split('\n').where(betterIsNice).length;
}

void main(List<String> args) {
  var inp = File('input.txt').readAsStringSync().trim();
  print(partOne(inp));
  print(partTwo(inp));
}

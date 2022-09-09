import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

void downloadInput(String day) {
  var url = Uri.https('adventofcode.com', '2015/day/${int.parse(day)}/input');
  var env = DotEnv()..load();
  var file = File('$day/input.txt');
  file.createSync(recursive: true);
  http.get(url, headers: {
    'Cookie': 'session=${env['SESSION']}',
  }).then((value) => file.writeAsString(value.body.trim()));
}

void main(List<String> args) {
  downloadInput(args[0]);
}

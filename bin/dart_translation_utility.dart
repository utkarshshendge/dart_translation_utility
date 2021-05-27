import 'dart:convert';
import 'dart:io';
import 'package:dart_translation_utility/dart_translation_utility.dart';

Future<void> main(List<String> arguments) async {
  final file = File('en.json');
  var directory = await Directory('lang').create(recursive: true);

  if (await file.exists()) {
    var contents = await file.readAsString();
    Map jsonMap = jsonDecode(contents);
    print('Grant me patience. But HURRY UP.\n\n');
    var languageList = ['af', 'fr', 'hi'];

    languageList.forEach((abbrevation) {
      translateJson(jsonMap: jsonMap, abbre: abbrevation, path: directory.path);
    });
  } else {
    print('Looks like the file is absent....');
  }
}

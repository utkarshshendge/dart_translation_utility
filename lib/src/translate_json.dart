import 'dart:convert';
import 'dart:io';

import 'package:translator/translator.dart';

Future<void> translateJson({Map jsonMap, String abbre, String path}) async {
  final encoder = JsonEncoder.withIndent('  ');
  final translator = GoogleTranslator();

  var valueArray = jsonMap.values.toList();
  var keyArray = jsonMap.keys.toList();

  for (var i = 0; i < valueArray.length; i++) {
    valueArray[i] =
        await translator.translate(valueArray[i], from: 'en', to: abbre);
  }
  print('***********************************');

  for (var k = 0; k < keyArray.length; k++) {
    jsonMap.update(keyArray[k], (value) => valueArray[k].toString());
  }

  var prettyString = encoder.convert(jsonMap);
  await File(path + '/' + abbre + '.json')
      .writeAsString(prettyString)
      .whenComplete(() => print(abbre + '.json' + ' added'));
}

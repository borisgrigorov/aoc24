import 'dart:io';

Future<List<String>> loadFile(String path) async {
  final file = File(path);
  final lines = await file.readAsLines();
  return lines;
}

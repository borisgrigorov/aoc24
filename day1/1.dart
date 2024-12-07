import '../shared/loadFile.dart';

Future main(List<String> args) async {
  final lines = await loadFile("input.txt");
  List<int> left = [];
  List<int> right = [];
  for (var i = 0; i < lines.length; i++) {
    List<int> row = lines[i]
        .split(" ")
        .where((e) => e.length > 0)
        .map((String i) => int.parse(i.trim()))
        .toList();
    left.add(row[0]);
    right.add(row[1]);
  }
  print("Part 1: ${partOne(left, right)}");
  print("Part 2: ${partTwo(left, right)}");
}

int partOne(List<int> left, List<int> right) {
  int difference = 0;
  left.sort();
  right.sort();
  if (left.length != right.length) {
    throw Exception("Left and right sides are not equal");
  }
  for (var i = 0; i < left.length; i++) {
    difference += (right[i] - left[i]).abs();
  }
  return difference;
}

int partTwo(List<int> left, List<int> right) {
  int similarity = left
      .map((e) => e * right.where((x) => x == e).length)
      .reduce((a, b) => a + b);
  return similarity;
}

import 'dart:io';

void main() async {
  final File file = File('input.txt');
  final String contents = await file.readAsString();

  final commandRegex = RegExp(r"mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)");

  final commands =
      commandRegex.allMatches(contents).map((match) => match.group(0)).toList();
  int sum = 0;
  bool enabled = true;
  for (final command in commands) {
    print(command);
    if (command == "do()") {
      enabled = true;
    } else if (command == "don't()") {
      enabled = false;
    } else if (enabled) {
      final numbers = command
          ?.substring(4, command.length - 1)
          .split(',')
          .map((e) => int.parse(e))
          .toList();
      sum += numbers![0] * numbers[1];
    }
  }
  print(sum);
}

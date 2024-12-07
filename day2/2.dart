import '../shared/loadFile.dart';

Future main() async {
  final lines = await loadFile("input.txt");
  final List<List<int>> reports =
      lines.map((row) => row.split(" ").map(int.parse).toList()).toList();
  int safeReports = reports.where(isReportSafe).length;
  int safeReportsWithTolerance =
      reports.where(isReportSafeWithTolerance).length;
  print("Safe reports: $safeReports");
  print("Safe reports with tolerance: $safeReportsWithTolerance");
}

bool isReportSafe(List<int> report) {
  final bool decreasing = report[0] > report[1];
  for (var i = 0; i < report.length - 1; i++) {
    int difference = (report[i] - report[i + 1]).abs();
    if (difference < 1 || difference > 3) {
      return false;
    }
    if (decreasing && report[i] < report[i + 1]) {
      return false;
    }
    if (!decreasing && report[i] > report[i + 1]) {
      return false;
    }
  }
  return true;
}

bool isReportSafeWithTolerance(List<int> report) {
  bool originalSafe = isReportSafe(report);
  if (originalSafe) return true;
  for (int i = 0; i < report.length; i++) {
    List<int> newReport = List.from(report);
    newReport.removeAt(i);
    if (isReportSafe(newReport)) {
      return true;
    }
  }
  return false;
}

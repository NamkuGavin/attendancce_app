class Attendance {
  final String date;
  final String clockIn;
  final String clockOut;
  final String workTime;
  final String location;
  final String totalHours;
  final String status;
  final String overtime;
  final String note;

  Attendance({
    required this.date,
    required this.clockIn,
    required this.clockOut,
    required this.workTime,
    required this.location,
    required this.totalHours,
    required this.status,
    required this.overtime,
    required this.note,
  });
}

import '../models/model_dummy_history.dart';

class Dummy {
  static List<Attendance> attendanceHistory = [
    // Pending approval entries
    Attendance(
      date: "Monday, 01 August 2024",
      clockIn: "09:00 AM",
      clockOut: "05:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:00 total hrs",
      status: "pending approval",
      overtime: "N/A",
      note: "N/A",
    ),
    Attendance(
      date: "Tuesday, 02 August 2024",
      clockIn: "10:00 AM",
      clockOut: "06:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:00 total hrs",
      status: "pending approval",
      overtime: "N/A",
      note: "N/A",
    ),
    Attendance(
      date: "Wednesday, 03 August 2024",
      clockIn: "08:00 AM",
      clockOut: "04:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:00 total hrs",
      status: "pending approval",
      overtime: "N/A",
      note: "N/A",
    ),
    // Approved entries
    Attendance(
      date: "Thursday, 04 August 2024",
      clockIn: "09:30 AM",
      clockOut: "06:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:30 total hrs",
      status: "approved",
      overtime: "00:30",
      note: "Presentasi project",
    ),
    Attendance(
      date: "Friday, 05 August 2024",
      clockIn: "08:00 AM",
      clockOut: "05:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "09:00 total hrs",
      status: "approved",
      overtime: "01:00",
      note: "Selesai task lebih cepat",
    ),
    Attendance(
      date: "Monday, 08 August 2024",
      clockIn: "09:00 AM",
      clockOut: "05:30 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:30 total hrs",
      status: "approved",
      overtime: "00:30",
      note: "Meeting dengan tim",
    ),
    Attendance(
      date: "Wednesday, 10 August 2024",
      clockIn: "08:00 AM",
      clockOut: "04:30 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "08:30 total hrs",
      status: "approved",
      overtime: "00:30",
      note: "Training internal",
    ),
    // Rejected entries
    Attendance(
      date: "Thursday, 11 August 2024",
      clockIn: "09:30 AM",
      clockOut: "05:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "07:30 total hrs",
      status: "rejected",
      overtime: "N/A",
      note: "Absen terlambat",
    ),
    Attendance(
      date: "Friday, 12 August 2024",
      clockIn: "08:00 AM",
      clockOut: "03:30 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "07:30 total hrs",
      status: "rejected",
      overtime: "N/A",
      note: "Pulang lebih awal",
    ),
    Attendance(
      date: "Monday, 15 August 2024",
      clockIn: "09:00 AM",
      clockOut: "04:00 PM",
      workTime: "10:00 AM - 07:00 PM",
      location:
          "Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333",
      totalHours: "07:00 total hrs",
      status: "rejected",
      overtime: "N/A",
      note: "Tidak selesai task",
    ),
  ];
}

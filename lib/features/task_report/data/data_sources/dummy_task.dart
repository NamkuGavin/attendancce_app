import '../models/model_dummy_task.dart';

class DummyTask {
  static List<TaskReport> taskReports = [
    TaskReport(
      taskType: "Meeting",
      status: "already",
      taskName: "Project Kickoff",
      taskDetail: "Discussing project scope and timeline",
      taskLocation:
          "Telekomunikasi Street No.1, Buahbatu - Bojongsoang, Telkom University, Sukapura, Dayeuhkolot District, Bandung Regency, West Java 40257",
      taskDate: "Monday, July 25 2024",
      startTime: "10:00 AM",
      endTime: "11:00 AM",
      reportNote: "Discussed initial project requirements and milestones",
    ),
    TaskReport(
      taskType: "Development",
      status: "no_report",
      taskName: "Feature Implementation",
      taskDetail: "Developing user authentication module",
      taskLocation:
          "Telekomunikasi Street No.1, Buahbatu - Bojongsoang, Telkom University, Sukapura, Dayeuhkolot District, Bandung Regency, West Java 40257",
      taskDate: "Tuesday, July 26 2024",
      startTime: "09:00 AM",
      endTime: "05:00 PM",
      reportNote: "N/A",
    ),
    TaskReport(
      taskType: "Testing",
      status: "already",
      taskName: "Module Testing",
      taskDetail: "Testing user authentication module",
      taskLocation:
          "Telekomunikasi Street No.1, Buahbatu - Bojongsoang, Telkom University, Sukapura, Dayeuhkolot District, Bandung Regency, West Java 40257",
      taskDate: "Wednesday, July 27 2024",
      startTime: "10:00 AM",
      endTime: "12:00 PM",
      reportNote: "Completed testing, found 3 minor bugs",
    ),
    TaskReport(
      taskType: "Research",
      status: "no_report",
      taskName: "Technology Research",
      taskDetail: "Researching new libraries for project",
      taskLocation:
          "Telekomunikasi Street No.1, Buahbatu - Bojongsoang, Telkom University, Sukapura, Dayeuhkolot District, Bandung Regency, West Java 40257",
      taskDate: "Thursday, July 28 2024",
      startTime: "02:00 PM",
      endTime: "04:00 PM",
      reportNote: "N/A",
    ),
    TaskReport(
      taskType: "Documentation",
      status: "already",
      taskName: "Project Documentation",
      taskDetail: "Writing project documentation",
      taskLocation:
          "Telekomunikasi Street No.1, Buahbatu - Bojongsoang, Telkom University, Sukapura, Dayeuhkolot District, Bandung Regency, West Java 40257",
      taskDate: "Friday, July 29 2024",
      startTime: "09:00 AM",
      endTime: "11:59 PM",
      reportNote: "Documented project requirements and API specifications",
    ),
  ];
}

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_school/models/student/schedule.dart';
import 'package:web_school/models/student/subject.dart';

class CalendarData extends CalendarDataSource {
  CalendarData(List<Subject> schedule) {
    this.appointments = schedule;
  }

  Subject getEvent(int index) => appointments![index] as Subject;

  @override
  DateTime getStartTime(int index) {
    final Schedule schedule = Schedule(
      day: getEvent(index).schedule![1].day,
      start: getEvent(index).schedule![1].start,
    );

    return getEvent(index).schedule!.first.getNextDayTime(schedule);
  }

  @override
  DateTime getEndTime(int index) {
    final Schedule schedule = Schedule(
      day: getEvent(index).schedule![1].day,
      start: getEvent(index).schedule![1].start,
    );

    return getEvent(index).schedule!.first.getNextDayTime(schedule);
  }

  @override
  String getSubject(int index) => getEvent(index).name;
}

extension ConvertDate on Schedule {
  DateTime getNextDayTime(Schedule schedule) {
    final now = DateTime.now();
    final daysUntilNextDay = (schedule.day - now.weekday + 7) % 7;
    final nextDay = now.add(Duration(days: daysUntilNextDay));
    return DateTime(
      nextDay.year,
      nextDay.month,
      nextDay.day,
      schedule.start.hour,
      schedule.start.minute,
    );
  }
}

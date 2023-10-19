class WeekDataModel {
  final String week;
  final String highestValue;

  WeekDataModel({required this.week, required this.highestValue});

  factory WeekDataModel.fromMap(Map<String, dynamic> map) {
    return WeekDataModel(
      week: map['day'],
      highestValue: map['value'],
    );
  }
}

class MonthDataModel {
  final int startDay;
  final int endDay;
  final double value;

  MonthDataModel(
      {required this.startDay, required this.endDay, required this.value});

  factory MonthDataModel.fromMap(Map<String, dynamic> map) {
    return MonthDataModel(
        startDay: map['startDay'], endDay: map['endDay'], value: map['value']);
  }
}

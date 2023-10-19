class ChartData {
  var xValue;
  var yValue;
  String? size;
  ChartData({this.xValue, this.yValue, this.size});
}

List<ChartData> chartData = [
  ChartData(xValue: "Sun", yValue: 18, size: "101"),
  ChartData(xValue: "Mon", yValue: 32, size: "90"),
  ChartData(xValue: "Tue", yValue: 12, size: "90"),
  ChartData(xValue: "Wed", yValue: 24, size: "90"),
  ChartData(xValue: "Thu", yValue: 11, size: "90"),
  ChartData(xValue: "Fri", yValue: 11, size: "90"),
  ChartData(xValue: "Sat", yValue: 11, size: "90"),
  ChartData(xValue: "Sun", yValue: 11, size: "90"),

  // ChartData(xValue: "Fri",yValue: 6,size: "90"),
  // ChartData(xValue: "Sat",yValue: 7,size: "90")
];

List<ChartData> chartDataWeek = [
  ChartData(xValue: "Sun", yValue: 18),
  ChartData(xValue: "Mon", yValue: 32),
  ChartData(xValue: "Tue", yValue: 12),
  ChartData(xValue: "Wed", yValue: 24),
  ChartData(xValue: "Thu", yValue: 11),
  ChartData(xValue: "Fri", yValue: 6),
  ChartData(xValue: "Sat", yValue: 7)
];

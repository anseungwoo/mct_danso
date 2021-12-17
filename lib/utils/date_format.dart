import 'package:intl/intl.dart';

String convertDateFormat(var date) {
  // var dateFormat = DateFormat('yyyy년 MM월 dd일 HH시 mm분');
  // print(DateFormat.jm().format(DateFormat('hh:mm:ss').parse(date)));

  var dateTime = DateTime.parse(date);
  var dateFormat = DateFormat('yyyy/MM/dd').format(dateTime);
  var hourAndMinute = DateFormat('hh:mm a').format(dateTime);
  var result = '$dateFormat $hourAndMinute';
  // var result = dateFormat.format(dateTime);
  return result;
}

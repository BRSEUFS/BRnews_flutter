import 'package:date_format/date_format.dart';

class Format{

  static String dateDMY(String date){
    var dateTime =  DateTime.parse(date);
    return  formatDate(dateTime, [dd, '/', mm, '/', yy]).toString();
  }
}
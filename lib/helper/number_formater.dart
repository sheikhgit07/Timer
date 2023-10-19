import 'package:intl/intl.dart';
class NumberFormatter{
  static String? formatter(String currentBalance) {
    try{
      // suffix = {' ', 'k', 'M', 'B', 'T', 'P', 'E'};
      int value = int.parse(currentBalance);

      if(value < 1000){ // less than a million
        return value.toStringAsFixed(0);
      }else if(value < 100000 && value > 1000){ // less than 100 million
        int result = value~/1000;
        return result.toStringAsFixed(0)+"K";
      } if(value < 1000000 && value > 100000){ // less than 100 million
        int result = value~/1000;
        return result.toStringAsFixed(1)+"K";
      }else if(value >= 1000000 && value < (1000000*10*100)){ // less than 100 million
        int result = value~/1000000;
        return result.toStringAsFixed(0)+"M";
      }else if(value >= (1000000*10*100) && value < (1000000*10*100*100)){ // less than 100 billion
        int result = value~/(1000000*10*100);
        return result.toStringAsFixed(0)+"B";
      }else if(value >= (1000000*10*100*100) && value < (1000000*10*100*100*100)){ // less than 100 trillion
        int result = value~/(1000000*10*100*100);
        return result.toStringAsFixed(0)+"T";
      }
    }catch(e){
      print(e);
    }
  }
}
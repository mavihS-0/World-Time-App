import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name for the UI
  late String time; //the time in that location
  String url;  // location url for api endpoint
  String flag; // url for the flag icon
  late bool isDaytime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    // error handling
    try{
      // getting datetime from timeapi
      Response response= await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data= jsonDecode(response.body);
      String datetime=data['dateTime'];
      // creating DateTime object
      DateTime now= DateTime.parse(datetime);

      // getting the value of boolean daytime
      isDaytime= now.hour>5 && now.hour<20 ? true : false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      time='Invalid Request';
      isDaytime=false;
      print('Caught error: $e');
    }

  }
}


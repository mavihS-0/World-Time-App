import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              color: Colors.grey[800],
              child: ListTile(
                title: Text(locations[index].location,style: TextStyle(color: Colors.white),),
                onTap: () {
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )

            );
          }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('© ',style: TextStyle(color: Colors.white,fontSize: 10.0),),
              Text('MAVIHS',style: TextStyle(color: Colors.white,fontSize: 9.0,letterSpacing: 0.4),textAlign: TextAlign.right,),
            ]),
        color: Colors.transparent,
      ),
    );
  }
}

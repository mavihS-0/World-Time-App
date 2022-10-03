import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    //getting arguments from loading.dart and mapping them
    data= data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    print(data);

    //building page according to isDaytime boolean
    String bgImage= data['isDaytime'] ? 'day.png' : 'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.lightBlueAccent : Colors.indigo[900];
    Color? font1 = data['isDaytime'] ? Colors.grey.withOpacity(0.7) : Colors.white.withOpacity(0.3);
    Color? font2 = data['isDaytime'] ? Colors.grey[850] : Colors.white;
    Color? font3 = data['isDaytime'] ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,60.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(Icons.edit_location,color: font3,size: 25.0,),
                  label: Text('Edit Location',style: TextStyle(color: font3,fontSize: 17.0),),
                  style: TextButton.styleFrom(
                    backgroundColor: font1,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: font2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    color: font2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('© ',style: TextStyle(color: font2,fontSize: 10.0),),
              Text('MAVIHS',style: TextStyle(color: font2,fontSize: 9.0,letterSpacing: 0.4),textAlign: TextAlign.right,),
            ]),
        color: Colors.transparent,
      ),
    );
  }
}

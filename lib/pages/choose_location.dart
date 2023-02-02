import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Karachi',
        flag: 'https://flagcdn.com/256x192/pk.png',
        url: 'Asia/Karachi'),
    WorldTime(
        location: 'Taiwan',
        flag: 'https://flagcdn.com/256x192/tw.png',
        url: 'Asia/Taipei'),
    WorldTime(
        location: 'China',
        flag: 'https://flagcdn.com/256x192/cn.png',
        url: 'Asia/Shanghai'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('from build function');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(locations[index].flag),
                  )),
            ),
          );
        }),
      ),
    );
  }
}

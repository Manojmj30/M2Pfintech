import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ITunes_List_Grid_Screen.dart';


class MediaListNewScreen extends StatefulWidget {
  List<dynamic>dataList=[];
  MediaListNewScreen({super.key, required this.dataList});
  MediaListNewScreenState createState() => MediaListNewScreenState();
}

class MediaListNewScreenState extends State<MediaListNewScreen> {
  List<dynamic>? _data;
  @override
  void initState() {
    super.initState();
    _data = widget.dataList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Color(0xFFFFFFFF),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          centerTitle: true,
          title: const Text('Media',style: TextStyle(color: Color(0xFFFFFFFF)),)),
      body: ListView.builder(
        itemCount: _data!.length,
        itemBuilder: (context, index) {
          final item = _data![index];
          item['kind']=='feature-movie'? item['kind']='movie': item['kind'];
          item['kind']=='tv-episode'? item['kind']='tvShow': item['kind'];
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ITunesListGridScreen(
                  mediaList:item['kind'].toString()?? '_'
              )));
            },
            leading: Column(
              children: [
                Text(item['kind'] ?? '-',style: const TextStyle(color: Color(0xFFFFFFFF,),fontSize: 16),),
              ],
            ),
            trailing: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.check,color: Color(0xFFFFFFFF),
              ), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ITunesListGridScreen(
               mediaList:item['kind'].toString()?? '_'
               )));
              },
            ),

          );
        },
      )
    );
  }
}



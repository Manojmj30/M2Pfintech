import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Constants/Constants.dart';
import 'ITunes_Description_Screen.dart';

class ITunesListGridScreen extends StatefulWidget {
  String?mediaList;
  ITunesListGridScreen({super.key, required this.mediaList});

  _ITunesListGridScreenState createState() => _ITunesListGridScreenState();
}

class _ITunesListGridScreenState extends State<ITunesListGridScreen> {

  List<dynamic> data = [];
  List<dynamic> datadesc = [];
  List<bool> isSelected = [true, false];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    setState(() {
      isLoading = true; // Show the loader
    });
    const url = 'https://itunes.apple.com/search?term';
    try {
      final response = await http.get(Uri.parse('$url=${GlobalVars.searchController.text}&entity=${widget.mediaList}'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        data = jsonData['results'] as List<dynamic>;
        print('RESULTS:$data');
        setState(() {
          isLoading = false; // Hide the loader
        });
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false; // Hide the loader on error
      });
      rethrow; // Propagate the error
    }
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
          title: const Text('iTunes',style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold),)),
      body:isLoading? Center(
        child: const CircularProgressIndicator(
          color: Color(0XFFFFFFFF),
        ),
      ):
      Column(
        children: [
          ToggleButtons(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Grid Layout',style:TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('List Layout',style:TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold)),
              ),
            ],
            disabledColor: const Color(0xFF1c1c1f),
            fillColor: const Color(0xFF5b5b60),
            borderRadius: BorderRadius.circular(10),
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
              });
            },
          ),
          const SizedBox(height:20),
          Expanded(
            child: isSelected[0] ? buildGridView() : buildListView(),
          ),
        ],
      ),

    );
  }

  Widget buildGridView() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItunesDescriptionScreen(
                movieImage:data[index]['artworkUrl100'] ,
                kind:data[index]['kind'],
                movieName:data[index]['trackCensoredName'],
                artistName: data[index]['artistName'],
                description: data[index]['shortDescription'],
                previewUrl:data[index]['previewUrl'] ,
              ),));
            },
            child: Column(
              children: <Widget>[
                Image.network(
                  data[index]['artworkUrl100']!,
                  height: 70,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 5),
                Text(data[index]['trackCensoredName']!,style: const TextStyle(color: Color(0xFFFFFFFF),fontSize: 12,fontWeight: FontWeight.bold),),
              ],
            ),
          );
        });
  }

  Widget buildListView() {
    return InkWell(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          item['kind']=='feature-movie'? item['kind']='movie': item['kind'];
          item['kind']=='tv-episode'? item['kind']='tvShow': item['kind'];
          return ListTile(
            onTap:(){
              print('SAA:${data[index]['artistName']}');
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItunesDescriptionScreen(
                kind:data[index]['kind'],
                movieName:data[index]['trackCensoredName'],
                artistName: data[index]['artistName'],
                description: data[index]['longDescription'],
                movieImage: data[index]['artworkUrl100'],
                previewUrl:data[index]['previewUrl'] ,
              ),));
            },
            leading: Image.network(data[index]['artworkUrl100'], height: 50,
              width: 50,
              fit: BoxFit.fill,),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index]['trackCensoredName'],style: const TextStyle(color: Color(0xFFFFFFFF),fontSize: 12,fontWeight: FontWeight.bold),),
              const SizedBox(height:30),
              ],
            ),

          );
        },
      ),
    );
  }
}

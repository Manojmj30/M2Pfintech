import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constants/Constants.dart';
import 'ITunes_media_new_list_item.dart';



class ITunesSearchScreen extends StatefulWidget {
  const ITunesSearchScreen({super.key});

  @override
  _ITunesSearchScreenState createState() => _ITunesSearchScreenState();
}

class _ITunesSearchScreenState extends State<ITunesSearchScreen> {
  late Future<List<dynamic>> _data;
  List<dynamic> _dataList = [];
  @override
  void initState() {
    super.initState();

  }

  Future<List<dynamic>> fetchData(String text) async {
    const url = 'https://itunes.apple.com/search?term';
    final response = await http.get(Uri.parse('$url=$text&limit=25'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final results = jsonData['results'] as List<dynamic>;
      setState(() {
        _dataList = results; 
      });
      print('AA:$_dataList');
      Navigator.push(context, MaterialPageRoute(builder: (context) => MediaListNewScreen(
          dataList:_dataList
      )));
      return results;

    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple,color: Colors.white,size: 30,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,5,0,0),
                    child: Text('iTunes',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.white,),),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Search for a variety of content from the iTunes store including iBooks, movies, music, music videos, and audiobooks.',
                style: TextStyle(fontSize: 14,color: Colors.white,fontWeight:FontWeight.bold,),
              ),
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: GlobalVars.searchController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF3a3a3c),
                  hintText: 'Search',
                  hintStyle:TextStyle(color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 30),
             const Text('Specify the parameter for the content to be searched',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
              const SizedBox(height: 30),
              Container(
                height:100,
                decoration: BoxDecoration(
                  color: const Color(0xFF1c1c1e),
                  borderRadius: BorderRadius.circular(0)
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChoiceChip(label: Text('album',style: TextStyle(color: Color(0XFFFFFFFF),),), selected: false,disabledColor: Color(0xFF808080), selectedColor:Colors.green,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(17)
                      ),)),
                    SizedBox(width:10),
                    ChoiceChip(label: Text('movie',style: TextStyle(
                      color:  Color(0XFFFFFFFF),),), selected: false,disabledColor: Color(0xFF808080),selectedColor:Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(17)
                          ),)
                    ),
                    SizedBox(width:10),
                    ChoiceChip(label: Text('musicVideo',style: TextStyle(
                      color:  Color(0XFFFFFFFF),),), selected: false,disabledColor: Color(0xFF808080),selectedColor:Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(17)
                          ),)
                    ),
                    SizedBox(width:10),
                    ChoiceChip(label: Text('song',style: TextStyle(
                      color:  Color(0XFFFFFFFF),),), selected: false,disabledColor: Color(0xFF808080),selectedColor:Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(17)
                          ),)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: (){
                  fetchData(GlobalVars.searchController.text);
                },
                child: Container(
                  height:50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0XFF555555),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(child: Text('Submit',style: TextStyle(color: Color(0XFFFFFFFF),fontSize: 16,fontWeight:FontWeight.bold,),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

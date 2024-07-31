import 'package:flutter/material.dart';

import 'ITunes_video_Screen.dart';


class ItunesDescriptionScreen extends StatefulWidget {
  String? movieImage;
  String? kind;
  String? movieName;
  String? artistName;
  String? description;
  String? previewUrl;
  ItunesDescriptionScreen(
      {super.key,
      required this.kind,
      required this.movieName,
      required this.artistName,
      required this.description,
      required this.movieImage,
      required this.previewUrl});
  @override
  State<ItunesDescriptionScreen> createState() =>
      _ItunesDescriptionScreenState();
}

class _ItunesDescriptionScreenState extends State<ItunesDescriptionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFFFFFFF),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            'Description',
            style: TextStyle(
                color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Flexible(
            child: buildListView(),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Preview",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 30),
          Image.network(
            widget.movieImage.toString(),
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 30),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              widget.description!.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(
            widget.movieImage.toString(),
            height: 150,
            width: 100,
            fit: BoxFit.cover,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                widget.movieName!.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                widget.artistName!.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                widget.kind!.toString(),
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () async {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ITunesVideoScreen(
                         previewUrl: widget.previewUrl.toString(),
                       )));
                      },
                      child: Text(
                        "Preview",
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                  IconButton(
                    icon: Icon(
                      Icons.compass_calibration,
                      color: Colors.cyan,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

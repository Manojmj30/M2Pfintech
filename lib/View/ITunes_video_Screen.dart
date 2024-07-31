
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class ITunesVideoScreen extends StatefulWidget {
  final String? previewUrl;
  const ITunesVideoScreen(
      {super.key,
        required this.previewUrl});

  @override
  State<ITunesVideoScreen> createState() => _ITunesVideoScreenState();
}

class _ITunesVideoScreenState extends State<ITunesVideoScreen> {
  ChewieController? _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.previewUrl.toString());

    _videoPlayerController.initialize().then(
          (_) => setState(
            () => _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }


  @override
  void dispose() {
    _chewieController!.videoPlayerController.pause();
    _chewieController!.dispose();
    _videoPlayerController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'video',
            style: TextStyle(
                color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: _videoPlayerController.value.isInitialized
      ? Center(

      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(controller: _chewieController!),
      ),
    )
        : const Center(
    child: CircularProgressIndicator(),
    )
      ),
    );

  }
}

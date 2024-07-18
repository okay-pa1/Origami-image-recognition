import 'package:flutter/material.dart';
import 'package:ori/consts/const.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool _isPlayerReady = false;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: results[mainindex].id.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    )..addListener((listener));
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          onReady: () {
            _controller.addListener(listener);
          },
        ),
        builder: (context, player) => Scaffold(
          body: Column(
            children: [
              player,
              SizedBox(
                height: 20,
              ),
              Text(
                results[mainindex].title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                results[mainindex].description.toString(),
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home/', (route) => false);
                  },
                  icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/final/', (route) => false);
                  },
                  icon: Icon(Icons.arrow_back))
            ],
          ),
        ),
      ),
    );
  }
}

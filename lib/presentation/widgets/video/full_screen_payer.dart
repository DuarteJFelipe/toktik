import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? GestureDetector(
                  onTap: () {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(children: [
                      VideoPlayer(_controller),
                      // Gradient
                      // Caption
                      Positioned(
                        bottom: 60,
                        left: 20,
                        child: _VideoCaption(caption: widget.caption),
                      )
                    ]),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    super.key,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(this.caption,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

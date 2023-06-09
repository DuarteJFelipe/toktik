import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_payer.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            // Video Player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                  caption: videoPost.caption, videoUrl: videoPost.videoUrl),
            ),

            // Botones
            Positioned(
              right: 20,
              bottom: 80,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}

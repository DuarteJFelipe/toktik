class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0, // = 0 default
    this.views = 0, // = 0 default
  });
}

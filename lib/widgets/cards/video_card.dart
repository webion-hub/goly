import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/video_collection.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final ThumbnailInfo video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    Future<void> goToVideo() async {
      Uri url = Uri.parse(video.url);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return GestureDetector(
      onTap: goToVideo,
      child: Card(
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: video.thumnailImg,
              width: 200,
              errorWidget: (context, url, error) => const Text('No image'),
            ),
            const SizedBox(width: 20),
            Flexible(child: Text(video.title)),
          ],
        ),
      ),
    );
  }
}

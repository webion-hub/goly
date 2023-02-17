import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final double? width;
  final String imageUrl;
  const UserImage({super.key, this.width, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }
}

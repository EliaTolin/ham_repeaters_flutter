import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.imageProfileUrl,
    this.size = 100,
    super.key,
  });
  final String? imageProfileUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage:
            imageProfileUrl != null ? CachedNetworkImageProvider(imageProfileUrl!) : null,
        child: imageProfileUrl == null ? const Icon(Icons.person, size: 50) : null,
      ),
    );
  }
}

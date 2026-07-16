import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import 'shimmer_box.dart';

class NetworkAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const NetworkAvatar({super.key, required this.imageUrl, required this.size});

  Widget _fallback() {
    return Container(
      width: size,
      height: size,
      color: AppColors.neutral200,
      child: Icon(Icons.person, size: size * 0.6, color: AppColors.neutral500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    return ClipOval(
      child: url == null
          ? _fallback()
          : CachedNetworkImage(
              imageUrl: url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 200),
              placeholder: (context, url) => ShimmerBox(
                width: size,
                height: size,
                borderRadius: BorderRadius.circular(size / 2),
              ),
              errorWidget: (context, url, error) => _fallback(),
            ),
    );
  }
}

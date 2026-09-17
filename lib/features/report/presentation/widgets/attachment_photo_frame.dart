import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Frame foto bukti kerusakan dengan badge "N Foto Terlampir" di
/// pojok kanan bawah.
class AttachmentPhotoFrame extends StatelessWidget {
  final String imageUrl;
  final int photoCount;

  const AttachmentPhotoFrame({
    super.key,
    required this.imageUrl,
    this.photoCount = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: 176,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: AppColors.surfaceContainerHigh),
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.surfaceContainerHigh,
                child: const Icon(Icons.image_not_supported_outlined,
                    color: AppColors.inverseOnSurface),
              ),
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.photo_camera, size: 14, color: AppColors.onSurface),
                    const SizedBox(width: 4),
                    Text(
                      '$photoCount Foto Terlampir',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

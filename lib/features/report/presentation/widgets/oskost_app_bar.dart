import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Header atas: judul "OsKost" + badge nomor kamar, dan aksi
/// notifikasi + avatar profil di kanan.
///
/// `PreferredSizeWidget` supaya bisa langsung dipasang di
/// `Scaffold.appBar`.
class OsKostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String roomLabel;
  final bool hasUnreadNotification;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const OsKostAppBar({
    super.key,
    required this.roomLabel,
    this.hasUnreadNotification = true,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface.withValues(alpha: 0.85),
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 64,
      titleSpacing: 20,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OsKost',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 8),
          _RoomBadge(label: roomLabel),
        ],
      ),
      actions: [
        _NotificationButton(
          hasUnread: hasUnreadNotification,
          onTap: onNotificationTap,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 4),
          child: GestureDetector(
            onTap: onProfileTap,
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: AppColors.onPrimary, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class _RoomBadge extends StatelessWidget {
  final String label;
  const _RoomBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.onSecondaryContainer,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  final bool hasUnread;
  final VoidCallback? onTap;
  const _NotificationButton({required this.hasUnread, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.onSurfaceVariant, size: 22),
          ),
          if (hasUnread)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

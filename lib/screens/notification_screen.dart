import 'package:celoe/models/notification_model.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Bar / Header area
        Container(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 20),
          decoration: const BoxDecoration(
            color: CeloeTheme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Notifikasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Notification List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: dummyNotifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = dummyNotifications[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                  border: notification.isRead
                      ? null
                      : Border.all(color: CeloeTheme.primaryColor.withValues(alpha: 0.3), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon based on type
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _getBackgroundColor(notification.type),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getIcon(notification.type),
                        color: _getIconColor(notification.type),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                _formatTime(notification.timestamp),
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification.message,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getBackgroundColor(NotificationType type) {
    switch (type) {
      case NotificationType.info:
        return Colors.blue.shade50;
      case NotificationType.warning:
        return Colors.orange.shade50;
      case NotificationType.success:
        return Colors.green.shade50;
      case NotificationType.alert:
        return Colors.red.shade50;
    }
  }

  Color _getIconColor(NotificationType type) {
    switch (type) {
      case NotificationType.info:
        return Colors.blue;
      case NotificationType.warning:
        return Colors.orange;
      case NotificationType.success:
        return Colors.green;
      case NotificationType.alert:
        return Colors.red;
    }
  }

  IconData _getIcon(NotificationType type) {
    switch (type) {
      case NotificationType.info:
        return Icons.info_outline;
      case NotificationType.warning:
        return Icons.warning_amber_rounded;
      case NotificationType.success:
        return Icons.check_circle_outline;
      case NotificationType.alert:
        return Icons.notifications_active_outlined;
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      return "${diff.inMinutes}m lalu";
    } else if (diff.inHours < 24) {
      return "${diff.inHours}j lalu";
    } else {
      return "${diff.inDays}h lalu";
    }
  }
}

enum NotificationType { info, warning, success, alert }

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final NotificationType type;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });
}

final List<NotificationModel> dummyNotifications = [
  NotificationModel(
    id: 'notif-1',
    title: "Maintenance Server",
    message: "LMS akan mengalami maintenance pada tanggal 28 Februari 2021 pukul 00:00 - 04:00 WIB.",
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    type: NotificationType.warning,
  ),
  NotificationModel(
    id: 'notif-2',
    title: "Tugas Baru: UI/UX",
    message: "Tugas 'Desain Prototype' telah ditambahkan. Tenggat waktu: 1 Maret 2021.",
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    type: NotificationType.info,
  ),
  NotificationModel(
    id: 'notif-3',
    title: "Nilai Keluar: Kewarganegaraan",
    message: "Nilai untuk UTS Kewarganegaraan telah dipublikasikan.",
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
    type: NotificationType.success,
  ),
  NotificationModel(
    id: 'notif-4',
    title: "Pengingat Jadwal Kuliah",
    message: "Kuliah 'Pemrograman Mobile' akan dimulai dalam 15 menit.",
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    type: NotificationType.alert,
  ),
];

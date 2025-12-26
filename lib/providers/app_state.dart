import 'package:celoe/models/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  List<NotificationModel> _notifications = dummyNotifications;
  bool _isLoggedIn = false;
  String _userName = "FAIZATUL MUNAWAROH";

  List<NotificationModel> get notifications => _notifications;
  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;

  int get unreadNotificationCount => 
      _notifications.where((n) => !n.isRead).length;

  AppState() {
    _loadLoginState();
  }

  Future<void> _loadLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _userName = prefs.getString('userName') ?? "FAIZATUL MUNAWAROH";
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // Simulasi login - dalam aplikasi nyata, ini akan melakukan API call
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userName', _userName);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    _isLoggedIn = false;
    notifyListeners();
  }

  void markNotificationAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = NotificationModel(
        id: _notifications[index].id,
        title: _notifications[index].title,
        message: _notifications[index].message,
        timestamp: _notifications[index].timestamp,
        type: _notifications[index].type,
        isRead: true,
      );
      notifyListeners();
    }
  }

  void deleteNotification(String notificationId) {
    _notifications.removeWhere((n) => n.id == notificationId);
    notifyListeners();
  }

  void markAllAsRead() {
    _notifications = _notifications.map((n) => NotificationModel(
      id: n.id,
      title: n.title,
      message: n.message,
      timestamp: n.timestamp,
      type: n.type,
      isRead: true,
    )).toList();
    notifyListeners();
  }
}

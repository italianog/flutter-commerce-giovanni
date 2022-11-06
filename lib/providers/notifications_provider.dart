import 'package:ecommerce/models/push_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsNotifier extends StateNotifier<List<PushNotification>> {
  NotificationsNotifier()
      : super(const [
          PushNotification(
              title: 'Prova delle prove 1',
              body: 'Body di prova',
              type: NotificationTypes.other,
              read: false),
          PushNotification(
              title: 'Prova delle prove 2',
              body: 'Body di prova',
              type: NotificationTypes.other,
              read: true),
          PushNotification(
              title: 'Prova delle prove 3',
              body: 'Body di prova',
              type: NotificationTypes.other,
              read: false)
        ]);

  void markNotificationAsRead() {}
}

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, List<PushNotification>>((ref) {
  return NotificationsNotifier();
});

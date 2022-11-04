enum NotificationTypes { marketing, update, other }

class PushNotification {
  final String title;
  final String body;
  final NotificationTypes type;
  final bool read;

  const PushNotification({
    required this.title,
    required this.body,
    required this.type,
    required this.read,
  });
}

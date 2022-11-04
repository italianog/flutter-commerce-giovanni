import 'package:ecommerce/fakedb/db.dart';
import 'package:ecommerce/ui/screens/notification_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../models/push_notification.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const routeName = '/notifications-screen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<PushNotification> _notifications = FakeDB.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Le tue notifiche'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _notifications.length,
              itemBuilder: (context, index) => NotificationListTile(
                pushNotification: _notifications[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    required this.pushNotification,
  }) : super(key: key);

  final PushNotification pushNotification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NotificationDetailScreen.routeName,
            arguments: pushNotification);
      },
      child: Container(
        decoration: BoxDecoration(
          color: pushNotification.read ? Colors.white : Colors.grey[200],
          border: const Border(
            bottom: BorderSide(color: Colors.black26, width: 0.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Text(pushNotification.title),
            const Spacer(),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

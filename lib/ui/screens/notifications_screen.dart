import 'package:ecommerce/ui/screens/notification_detail_screen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const routeName = '/notifications-screen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Le tue notifiche'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) => NotificationListTile(
                    index: index, read: index % 2 == 0 ? true : false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    required this.index,
    required this.read,
  }) : super(key: key);

  final int index;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NotificationDetailScreen.routeName, arguments: index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: read ? Colors.white : Colors.white54,
          border: const Border(
            bottom: BorderSide(color: Colors.black26, width: 0.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text('Notifica ${index + 1}'),
            const Spacer(),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

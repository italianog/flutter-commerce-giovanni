import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/notification-detail-screen';

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  int? id;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = ModalRoute.of(context)?.settings.arguments as int;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifica',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            if (id != null) Text('${id! + 1}'),
          ],
        ),
      ),
    );
  }
}

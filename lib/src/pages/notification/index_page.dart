import 'package:ds_master_detail/src/pages/notification/widgets/notification_list.widget.dart';

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avisos'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: NotificationList(),
    );
  }
}

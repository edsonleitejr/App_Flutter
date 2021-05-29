import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:flutter/material.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({
    @required this.notification,
  });
  final Notifications notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do aviso'),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            _buildInformation(),
            Container(
              width: 230,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Voltar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildInformation() {
    return Card(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(children: [
          Text(
            notification.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(notification.dateCreated),
          SizedBox(
            height: 10,
          ),
          Text(notification.description()),
        ]),
      ),
    );
  }
}

import 'package:ds_master_detail/src/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({
    @required this.notification,
  });
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do aviso'),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              _buildInformation(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(
                          left: 3, right: 3, top: 15, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text('Voltar'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildInformation() {
    var messageHtml = notification.mensagem;
    return Card(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(children: [
          Text(
            notification.titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(notification.data_publicacao),
          SizedBox(
            height: 10,
          ),
          Html(data: messageHtml)
        ]),
      ),
    );
  }
}

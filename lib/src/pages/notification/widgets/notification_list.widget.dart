import 'package:ds_master_detail/src/models/notification_model.dart';
import 'package:ds_master_detail/src/pages/notification/widgets/notification_details.widget.dart';
import 'package:ds_master_detail/src/services/notification_service.dart';
import 'package:ds_master_detail/src/widgets/loading.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationService _noticationService = NotificationService();
    return Container(
      child: FutureBuilder(
        future: _noticationService.getNotification(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NotificationModel>> snapshot) {
          if (snapshot.hasError) {
            return Container(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Algum erro ocorreu na comunicacao com a API'),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      _noticationService.getNotification();
                    },
                    child: Text('Tentar novamente'))
              ],
            )));
          }
          if (!snapshot.hasData) {
            return Loading();
          }

          var data = snapshot.data;
          return Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, indice) {
                      final item = data[indice];
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationDetails(
                              notification: item,
                            ),
                          ),
                        ),
                        child: Container(
                          height: 80,
                          child: Card(
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(item.titulo),
                                    ),
                                    Text(item.data_publicacao),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.keyboard_arrow_right_sharp)
                                  ],
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

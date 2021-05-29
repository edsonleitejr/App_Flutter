import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:ds_master_detail/src/pages/notification/widgets/notification_details.widget.dart';
import 'package:ds_master_detail/src/services/product_service.dart';
import 'package:ds_master_detail/src/widgets/error_message.dart';
import 'package:ds_master_detail/src/widgets/loading.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationService _noticationService = NotificationService();
    return Container(
      child: FutureBuilder(
        future: _noticationService.getNotifications(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Notifications>> snapshot) {
          if (snapshot.hasError) {
            return ErrorMessage(snapshot.error);
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
                                      child: Text(item.title),
                                    ),
                                    Text(item.dateCreated),
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

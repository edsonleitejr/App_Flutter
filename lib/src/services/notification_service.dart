import 'dart:convert';
import 'dart:math';
import 'package:ds_master_detail/src/models/notification_model.dart';
import 'package:http/http.dart' as http;

class NetworkException {
  final String message;

  NetworkException(this.message);
}

class NotificationService {
  
  Future<List<NotificationModel>> getNotification() async {
    final response = await http
        .get(Uri.https('coopertransc.com.br', 'intranet2/public/avisos'));
    final decodedJson = jsonDecode(response.body);
    final result = (decodedJson['data'] as List)
        .map((item) => NotificationModel.fromJson(item))
        .toList();
    return result;
  }
}

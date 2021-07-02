import 'dart:io';
import 'package:ds_master_detail/src/pages/index.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(IndexPage());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
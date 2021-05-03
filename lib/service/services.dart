import 'package:dio/dio.dart';

const host = "192.168.8.144";
const port = "8080";

const baseUrl = "http://$host:$port";

final dioInstance = Dio(
  BaseOptions(
    baseUrl: baseUrl,
  ),
);

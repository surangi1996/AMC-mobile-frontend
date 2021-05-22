import 'package:amc_new/widgets/AuthInterceptor.dart';
import 'package:dio/dio.dart';

const host = "192.168.8.144";
const port = "8080";

const baseUrl = "http://$host:$port";

// const headers = (<String, dynamic>{
//   'Content-Type': 'application/json',
//   'Accept': 'application/json',
//   'Authorization': 'Bearer {jwt}',
// });

final dioInstance = Dio(BaseOptions(
  baseUrl: baseUrl,
))
  ..interceptors.addAll([AuthInterceptor()]);

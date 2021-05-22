import 'package:amc_new/widgets/loginUserdler.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  Future onRequest(RequestOptions options) async {
    final jwt = await getAccessToken();
    options.headers['Authorization'] = 'Bearer $jwt';
    return options;
  }

  Future<String> getAccessToken() async {
    return storage.read(key: "jwt");
  }
}

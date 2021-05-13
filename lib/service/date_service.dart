import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'date_service.g.dart';

@RestApi()
abstract class DateService {
  factory DateService(Dio dio, {String baseUrl}) = _DateService;

  @GET('/receipt/getDate/{amcNo}')
  Future<List<String>> getDate(@Path('amcNo') String amcNo);
}

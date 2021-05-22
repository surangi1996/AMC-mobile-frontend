import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'amc_master_service.g.dart';

@RestApi()
abstract class AmcMasterService {
  factory AmcMasterService(Dio dio, {String baseUrl}) = _AmcMasterService;

  @GET('/amcMaster/client/allamcno/{userId}')
  Future<List<String>> getAllAmcNo(@Path('userId') String userId);
}

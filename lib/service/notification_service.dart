import 'package:amc_new/model/notifications.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'notification_service.g.dart';

@RestApi()
abstract class NotificationService {
  factory NotificationService(Dio dio, {String baseUrl}) = _NotificationService;

  @GET('/notification/getNotification/{userId}')
  Future<List<Notifi>> getNotification(@Path('userId') String userId);

  @PUT('/notification/notificationIsRead/{userId}')
  Future<void> updateIsRead(@Path('userId') String userId);
}

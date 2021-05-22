import 'package:amc_new/model/notifications.dart';
import 'package:amc_new/service/notification_service.dart';
import 'package:amc_new/service/services.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:amc_new/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  NotificationService notificationService =
      new NotificationService(dioInstance);
  // NotificationIsReadService notificationIsReadService =
  //     NotificationIsReadService(dioInstance);
  TextEditingController isRead = TextEditingController();
  bool circular = false;
  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        circular = true;
        fetchNotification();
      });
    }
  }

  List<Notifi> notification;
  var userId;
  // var jwt;
  bool isLoading = true;
  fetchNotification() async {
    // jwt = await storage.read(key: "jwt");
    userId = await storage.read(key: "userId");
    notification = await notificationService.getNotification(userId);
    if (notification != null) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      appBar: appBar(context),
      body: ListView.builder(
        itemCount: notification.length,
        itemBuilder: (BuildContext context, int index) {
          return card(notification[index]);
        },
      ),
    );
  }

  Widget card(Notifi item) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
      child: ExpansionTileCard(
        onExpansionChanged: (value) {
          print(value);
          if (value == true) {
            notificationService.updateIsRead(userId);
            item.isRead = false;
          } else {
            setState(() {});
          }
        },
        elevation: 20.0,
        baseColor: Colors.cyan[50],
        expandedColor: Colors.red[100],
        leading: item.isRead == true
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3.0, color: Color(0xFF03A9F4)),
                ),
                // margin: EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/epic-lanka-logo.png",
                  width: 50.0,
                  height: 50.0,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                // margin: EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/epic-lanka-logo.png",
                  width: 50.0,
                  height: 50.0,
                ),
              ),
        title: Text(
          notification == null ? "(Empty)" : item.savedDate.toString(),
        ),
        subtitle: Text("EPIC LANKA TECHNOLOGY"),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                notification == null ? "(Empty)" : item.notification,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

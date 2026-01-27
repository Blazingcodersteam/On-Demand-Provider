// @dart=2.9
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:on_demand_service_providers/view/commonpage/splash_screen.dart';
import 'package:on_demand_service_providers/view/routes/approutes.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart' as http;
import 'Controller/logincontroller.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 init();
  await GetStorage.init();
  await Permission.notification.isDenied.then((value) async {
    if (value) {
      Permission.notification.request();
    }
    await Permission.location.isDenied.then((value){
      if(value){
        Permission.location.request();
      }
    });
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeNotifications().initialize(
      'resource://drawable/icon',
      [
        NotificationChannel(
          //  channelGroupKey: 'basic_test'
          channelKey: "basic",
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          defaultColor: const Color(0xFFde2127),
          ledColor: Colors.white,
          playSound: true,
        ),
      ]
  );
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessage);
  runApp( const MyApp());
}
@pragma('vm:entry-point')
Future<dynamic> firebaseBackgroundMessage(RemoteMessage message) async {
  print(message);
  if( Getstore.box.read("userid")!=null) {
    if (message.data["badge"] != "2") {
      AwesomeNotifications().createNotification(
          content: NotificationContent( //with image from URL
            id: int.parse(message.data["badge"]),
            channelKey: "basic",
            //channel configuration key
            title: message.data["sender_name"],
            body: message.data["body"],
            // bigPicture: message.data["image"],
            largeIcon: message.data["image"],
            notificationLayout: NotificationLayout.BigPicture,
            // icon:message.data["image"],

          ),
          actionButtons: [
            NotificationActionButton(
              color: const Color(0xff5988FF),
              key: "open",
              label: "Open",

            ),
          ]
      );
      AwesomeNotifications().actionStream.listen((receivedNotification) {
        if (receivedNotification.buttonKeyPressed == 'open' &&
            message.data["purpose"] == "Booking_confirm" &&
            Getstore.box.read("role") == "2") {
          // Get.put(Doctordashboardcontroller()).dashboard(
          //     {
          //       "doctor_id": message.data["user_id"],
          //     },
          //     "doctor_dashboard"
          // );
          // Get.toNamed(AppRoutes.doctordashboard);
        }
      });
    } else {
      AwesomeNotifications().createNotification(
          content: NotificationContent( //with image from URL
            id: int.parse(message.data["badge"]),
            channelKey: "basic",
            //channel configuration key
            title: message.data["title"],
            body: message.data["body"],
            // bigPicture: message.data["image"],
            //  largeIcon:  message.data["image"],
            // notificationLayout: NotificationLayout.BigPicture,
            // icon:message.data["image"],
          ),
          actionButtons: [
            NotificationActionButton(
              color: const Color(0xff5988FF),
              key: "open",
              label: "Open",

            ),
          ]
      );
    }
  }
  // if(SharedPreference.userId!=null) {
  //   print(message.data);
  //
  //
  // }
}
Future init() async {
  await Firebase.initializeApp();
  final firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.getToken().then((value) async {
    debugPrint('Token: $value');
    await http.post(Uri.parse('https://demo.cloneifypro.com/Api_notify/item/save_device'),body: {'app_name':"Uber for babysitter-provider",'device_id':value.toString()});
  }
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget child) {
        return GetMaterialApp(
          theme: ThemeData(
              // useMaterial3: true,

          ),
          // darkTheme: ThemeData(
          //
          // ),
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   fontFamily:'Roboto',
          // ),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
           home: const Splashscreen(),
          // initialRoute: AppRoutes.splashscreen,
         getPages: AppRoutes.pages,
          // initialBinding: CommonBindings(),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fnancialinclusioncds2020/notifier/federal_achievement_images_notifier.dart';
import 'package:fnancialinclusioncds2020/notifier/federal_arial_notifier.dart';
import 'package:provider/provider.dart';
import './notifier/achievement_images_notifier.dart';
import './notifier/batch_a_stream_one_notifier.dart';
import './notifier/batch_b_stream_one_notifier.dart';
import './notifier/batch_b_stream_two_notifier.dart';
import './notifier/batch_c_stream_one_notifier.dart';
import './notifier/batch_c_stream_two_notifier.dart';
import './notifier/executive_cds_coordinators_notifier.dart';
import 'notifier/lg_officials_notifier.dart';

import './sidebar/sidebar_layout.dart';


void main() {

  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {
    // ...
  }, onError: Crashlytics.instance.recordError);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BatchAStreamOneNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => BatchBStreamOneNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => BatchBStreamTwoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => BatchCStreamOneNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => BatchCStreamTwoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExecutiveCDSCoordinatorsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => LGOfficialsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => AchievementsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FederalAchievementsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FederalArialNotifier(),
          ),

        ],
        child: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
  return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SideBarLayout(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}

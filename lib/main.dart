// ignore_for_file: prefer_const_constructors, file_names,prefer_const_literals_to_create_immutables,library_prefixes, avoid_print
import 'package:alzad/Providers/AuthProvider.dart';
import 'package:alzad/Screens/Splash.dart';
import 'package:alzad/Utilities/AuthCheck.dart';
import 'package:alzad/Utilities/NavBar.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final _navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            title: 'AlZad',
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = EasyLoading.init()(context, child);
              child = BotToastInit()(context, child);
              return child;
            },
            navigatorKey: _navigatorKey,
            home: AuthCheck());
      },
    );
  }
}

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whatcard/services/shared_preferences.dart';

import 'app/index.dart';
import 'utils/state_logger.dart';

import 'theme.dart';
import 'firebase_options.dart';
import 'providers.dart';

// Main function run on startup
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await WhatCardTheme.initialize();
  await Firebase.initializeApp(
    name: "whatcard",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // debugPaintSizeEnabled = true;

  // Ideal time to initialize
  if (foundation.kReleaseMode == false) {
    FirebaseFunctions.instance.useFunctionsEmulator('192.168.1.229', 5001);
  }

  // init shared prefs
  final sharedPreferences = await SharedPreferences.getInstance();

  // Ask for background notification permission
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // Ask for foreground notification permission
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    ProviderScope(
      observers: const [StateLogger()],
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(sharedPreferences),
        ),
      ],
      child: const Application(),
    ),
  );
}

class Application extends ConsumerStatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'WhatCard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}

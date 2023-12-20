import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // 2 second splash screen
      final timer = Timer(const Duration(seconds: 2), () {
        GoRouter.of(context).goNamed('LoginPage');
      });

      // Cancel timer on unbsub
      return () => timer.cancel();
    }, const []);

    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}

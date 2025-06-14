// ignore_for_file: deprecated_member_use, unused_import

import 'dart:async';
import 'dart:math';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/auth/screens/sign_In_screen.dart';
import 'package:app_7/presentation/screens/auth/screens/sign_up_screen.dart';
import 'package:app_7/presentation/screens/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late Animation<double> _rotateAnimation;

  Timer? timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 2),
      () {
        // pushAndRemoveUntil(context, Home());
        final proAuth = Provider.of<Auth_Controller>(context, listen: false);

        proAuth.checkLoginStatus(context);
      },
    );

    _rotateAnimation = CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.easeOut));

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {}
      },
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _controller.forward(from: 0);
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final rotation = 2 * pi * (_rotateAnimation.value);
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(rotation),
                      child: Image.asset('assets/images/frist-logo.png', height: 100),
                    );
                  },
                ),
                Image.asset('assets/images/wite-name.png', height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

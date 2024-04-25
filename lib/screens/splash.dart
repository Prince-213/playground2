import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  void initState() {
    if (kDebugMode) {
      print('initialized');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(seconds: 3), () {
      context.go('/home-screen');
    });

    return Scaffold(
      backgroundColor: const Color(0xFFE65F5C),
      body: Stack(children: [
        Transform.translate(
          offset: const Offset(-60, -60),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 237, 59, 56).withOpacity(.6),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(320, 180),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 237, 59, 56).withOpacity(.6),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(170, 580),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 237, 59, 56).withOpacity(.6),
            ),
          ),
        ),
        SizedBox(
            height: screenHeight,
            width: double.infinity,
            /* decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/3376820.jpg'),
                  fit: BoxFit.cover),
            ), */
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Quick Code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 42),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}

import 'dart:ui';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:quick_code/src/helper/colors.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: blueBlack,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,

        body: Padding(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30),
          child: VStack([
            VStack([
              HStack([
                Text('Privacy').text.size(36).color(Vx.teal100).bold.make(),
                SizedBox(width: 10,),
                Text('Sharing').text.size(36).color(Vx.white).make(),

              ]),


              Text('Guarantee').text.size(36).color(Vx.white).make(),
            ]),
            SizedBox(height: 10,),
            Text("Tasks can be proritized and set with deadlines, so all team members have visibility into the project's progress.").text.size(16).color(Vx.gray400).make(),
            SizedBox(height: 80,),
            ActionSlider.standard(
              child: Text('Get Started').text.lg.bold.make().pLTRB(10, 0, 0, 0),
              sliderBehavior: SliderBehavior.stretch,
              width: context.percentWidth * 60,
              backgroundColor: beige,
              toggleColor: blueBlack,
              icon: Icon(Icons.arrow_right_alt_outlined, color: Colors.white,),
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(seconds: 3));
                controller.success(); //starts success animation
                await Future.delayed(const Duration(seconds: 1));
                context.go('/home-screen');
                controller.reset(); //resets the slider
              },
              successIcon: Icon(EvaIcons.checkmark_outline, color: Vx.emerald300,),
              loadingIcon: Icon(EvaIcons.loader_outline, color: Colors.white,),

            )

          ], alignment: MainAxisAlignment.end,).box.height(context.percentHeight * 90).make(),
        ),
      ),
    );
  }
}


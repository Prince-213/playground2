import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:quick_code/src/helper/colors.dart';


class SplashTaskScreen extends StatelessWidget {
  const SplashTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: black,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar:
            const SafeArea(child: SafeArea(child: BottomBar())),
        body: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: context.percentWidth * 15,
                  child: Container(
                    width: context.percentWidth * 80,
                    height: 440,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/highhouse.png'),
                            fit: BoxFit.cover)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack([
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: VxBox(
              child: VStack(
            [
              const Text('TaskCraft')
                  .text
                  .semiBold
                  .xl5
                  .color(Vx.white)
                  .make()
                  .objectCenter(),
              const Text('ModernTask Tracker', style: TextStyle(fontFamily: 'Satoshi'))
                  .text
                  .medium
                  
                  .lg
                  .color(Vx.white.withOpacity(.4))
                  .make()
                  .objectCenter(),
            ],
            alignment: MainAxisAlignment.center,
          )).roundedLg.height(140).color(matBlack.withOpacity(.8)).make(),
        ),
      ),
      VxCapsule(
        backgroundColor: matBlack,
        height: 65,
        child: HStack(
          [
            InkWell(
              child: VxCapsule(
                backgroundColor: black,
                width: 80,
                child: Icon(
                  EvaIcons.arrowhead_right,
                  color: Vx.white,
                  size: 24,
                ),
              ).p4(),
            ),
            const Text('Swipe to Skip')
                .text
                .semiBold
                .color(Vx.white.withOpacity(.5))
                .make()
                .objectCenter(),
            InkWell(
              onTap: () { context.go('/home-screen'); },
              child: VxCapsule(
                backgroundColor: black,
                width: 80,
                child: Icon(
                  EvaIcons.corner_up_right,
                  color: Vx.white,
                  size: 24,
                ),
              ).p4(),
            ),
          ],
          alignment: MainAxisAlignment.spaceBetween,
        ),
      ).py(2),
      VxBox(
              child: VStack([
        InkWell(
          onTap: () {},
          child: VxCapsule(
            height: 60,
            backgroundColor: black,
            child: const Text('Create an account')
                .text
                .semiBold
                .color(Vx.blue400)
                .make()
                .objectCenter(),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        InkWell(
          onTap: () {},
          child: VxCapsule(
            height: 60,
            backgroundColor: matGrey,
            child: const Text('Login')
                .text
                .color(Vx.white)
                .semiBold
                .make()
                .objectCenter(),
          ),
        ),
        Spacer(),
        const Text('Sponsored by EmrancisGroup')
            .text
            .color(Vx.white.withOpacity(.2))
            .semiBold
            .make()
            .objectCenter()
      ]))
          .color(matBlack)
          .height(context.percentHeight * 28)
          .p24
          .roundedLg
          .make()
    ]).box.make().p8();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_code/screens/create_qr_code.dart';
import 'package:quick_code/widgets/scan_screen_widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lottie/lottie.dart';
part '../models/providers/homepage.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 1;

  void setActive(int value) => state = value;
}

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends ConsumerState<Homepage>
    with TickerProviderStateMixin {
  final List<Widget> tabs = [
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.border_outer_rounded,
          size: 26,
        )),
    IconButton(
        onPressed: () {},
        icon: const FaIcon(
          FontAwesomeIcons.clock,
          size: 24,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.qr_code_rounded,
          size: 26,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.settings_outlined,
          size: 26,
        )),
  ];

  final List<Widget> scanOptions = [
    IconButton(
        onPressed: () {},
        icon: const FaIcon(
          FontAwesomeIcons.fileImage,
          size: 24,
        )),
    IconButton(
        onPressed: () {},
        icon: const FaIcon(
          FontAwesomeIcons.fileVideo,
          size: 24,
        )),
    IconButton(
        onPressed: () {},
        icon: const FaIcon(
          FontAwesomeIcons.cameraRetro,
          size: 24,
        )),
  ];

  final List<String> ad = ['Batch Scan', 'Protect Custom QR Codes', 'NO Ads'];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int count = ref.watch(counterProvider);
    final Counter counter = ref.watch(counterProvider.notifier);

    Widget getScreenWidget(int currentPage) {
      switch (currentPage) {
        case 1:
          return const ScanScreen();
        case 2:
          return const Text('Second Page');
        case 3:
          return const CreateQRCode();

        default:
          return const Text('Error');
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Stack(
              children: [
                Transform.translate(
                  offset: const Offset(10, -10),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 183, 67, 65)
                            .withOpacity(.2),
                        shape: BoxShape.circle),
                  ),
                )
              ],
            )
          ],
          backgroundColor: const Color(0xFFE65F5C),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          title: const Text(
            'Creator',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
        bottomSheet: BottomAppBar(
          height: count == 1 ? 160 : 90,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: const EdgeInsets.all(20),
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 5,
                      spreadRadius: 5)
                ]),
            child: Column(children: [
              count == 1
                  ? Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: scanOptions,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomNavIcon(
                        icon: FontAwesomeIcons.borderAll,
                        activeIndex: 1,
                        count: count,
                        navigator: counter,
                      ),
                      BottomNavIcon(
                        icon: FontAwesomeIcons.clock,
                        activeIndex: 2,
                        count: count,
                        navigator: counter,
                      ),
                      BottomNavIcon(
                        icon: FontAwesomeIcons.qrcode,
                        activeIndex: 3,
                        count: count,
                        navigator: counter,
                      ),
                      BottomNavIcon(
                        icon: FontAwesomeIcons.gear,
                        activeIndex: 4,
                        count: count,
                        navigator: counter,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        body: getScreenWidget(count));
  }
}

class ScanScreen extends StatelessWidget {
  const ScanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child:
                    Lottie.asset(fit: BoxFit.cover, 'assets/lottie/code.json'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    super.key,
    required this.icon,
    required this.activeIndex,
    required this.count,
    required this.navigator,
  });

  final IconData icon;
  final int activeIndex;
  final int count;
  final dynamic navigator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: count == activeIndex ? 1 : .5,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: IconButton(
              onPressed: () {
                navigator.setActive(activeIndex);
              },
              color:
                  count == activeIndex ? const Color(0xFFE65F5C) : Colors.black,
              icon: FaIcon(
                icon,
                size: 24,
              )),
        ),
        Positioned(
            bottom: 0,
            left: 22,
            child: AnimatedScale(
              scale: count == activeIndex ? 1 : 0,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                    color: Color(0xFFE65F5C), shape: BoxShape.circle),
              ),
            ))
      ],
    );
  }
}

class AdBanner extends StatelessWidget {
  const AdBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Image(
                image: AssetImage(
                    'assets/images/bloom-man-shopping-online-by-phone.png'),
                width: 90,
                height: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Go Pro',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Mosk',
                        fontSize: 18),
                  ),
                  AdTile(
                    ad: 'Create BarCodes',
                  ),
                  AdTile(
                    ad: 'No Ads',
                  )
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(Color(0xFFE65F5C))),
            child: const Text(
              'PRO',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class AdTile extends StatelessWidget {
  const AdTile({
    super.key,
    required this.ad,
  });

  final String ad;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.check,
          size: 12,
          color: Colors.green,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          ad,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: Colors.black45),
        )
      ],
    );
  }
}

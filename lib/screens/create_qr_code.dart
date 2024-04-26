import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_code/widgets/scan_screen_widgets.dart';

class CreateQRCode extends StatefulWidget {
  const CreateQRCode({super.key});

  @override
  State<CreateQRCode> createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> qrCodeOptions = [
      {
        'title': 'Website',
        'descp': 'Creates website link',
        'icon': FontAwesomeIcons.globe,
        'color': Colors.lightBlue
      },
      {
        'title': 'Email',
        'descp': 'Easy share your email address or send emails',
        'icon': FontAwesomeIcons.envelope,
        'color': Colors.orange
      },
      {
        'title': 'Instagram',
        'descp': 'Share your Instagram page quick',
        'icon': FontAwesomeIcons.instagram,
        'color': Colors.pink
      }
    ];

    final double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const AdBanner(),
            SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              child: ListView.separated(
                  itemCount: qrCodeOptions.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40, top: 20),
                      child: Container(
                        width: 2,
                        height: 2,
                        color: Colors.grey.withOpacity(.2),
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: ListTile(
                        onTap: () {},
                        isThreeLine: false,
                        contentPadding: EdgeInsets.only(left: 10),
                        splashColor:
                            qrCodeOptions[index]['color'].withOpacity(.1),
                        selected: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        title: Text(
                          qrCodeOptions[index]['title'],
                          style: const TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          qrCodeOptions[index]['descp'],
                          style: const TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                        leading: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                qrCodeOptions[index]['color'].withOpacity(.15),
                          ),
                          child: Center(
                              child: FaIcon(
                            qrCodeOptions[index]['icon'],
                            color: qrCodeOptions[index]['color'],
                            size: 16,
                          )),
                        ),
                        trailing: Checkbox.adaptive(
                          value: false,
                          onChanged: (value) {},
                          fillColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          activeColor: Colors.lightGreenAccent,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateQRCode extends StatefulWidget {
  const CreateQRCode({super.key});

  @override
  State<CreateQRCode> createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> qr_code_options = [
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Create QR Codes',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Satoshi'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      child: const Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Satoshi'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      side: MaterialStatePropertyAll(BorderSide(
                        width: 2,
                        color: Colors.grey.withOpacity(.15),
                      )),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      leading: const Icon(Icons.search),
                      hintText: 'Search QR Code',
                      /* trailing: <Widget>[
                    Tooltip(
                      message: 'Change brightness mode',
                      child: IconButton(
                        isSelected: false,
                        onPressed: () {},
                        icon: const Icon(Icons.wb_sunny_outlined),
                        selectedIcon: const Icon(Icons.brightness_2_outlined),
                      ),
                    )
                  ], */
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        return ListTile(
                          onTap: () {},
                          splashColor: Colors.lightBlueAccent.withOpacity(.1),
                          selected: true,
                          title: const Text(
                            'WebSite Link',
                            style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: const Text(
                            'Creates website link',
                            style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          leading: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lightBlueAccent.withOpacity(.15),
                            ),
                            child: const Center(
                                child: FaIcon(
                              FontAwesomeIcons.globe,
                              color: Colors.lightBlue,
                            )),
                          ),
                          trailing: Checkbox.adaptive(
                            value: false,
                            onChanged: (value) {},
                            fillColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            activeColor: Colors.lightGreenAccent,
                          ),
                        );
                      }, childCount: 10))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 100,
                  color: Colors.red,
                  width: double.infinity,
                ),
              ))
        ],
      ),
    );
  }
}

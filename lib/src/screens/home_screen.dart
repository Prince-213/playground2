import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:quick_code/src/helper/colors.dart';
import 'package:flutter/services.dart';
import 'package:avatar_stack/avatar_stack.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(backgroundColor: black, surfaceTintColor: black, shadowColor: black, foregroundColor: black, elevation: 0, toolbarHeight: 0,),
      bottomNavigationBar: SafeArea(child: BottomNavBar()),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Vx.black,
            expandedHeight: context.percentHeight * 25,
            collapsedHeight: context.percentHeight * 20,
            floating: true,
            flexibleSpace: SafeArea(child: RecapView())
          ),
          SliverList.list(children: [
            SearchView(),
            TasksView(),
            GridSections()
          ])
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return HStack([
      InkWell( onTap: () {}, child: Image(image: AssetImage('assets/images/icons8-four-squares-96.png'), width: 26, height: 26,),),
      Spacer(),
      InkWell( onTap: () {}, child: Image(image: AssetImage('assets/images/icons8-calendar-96.png'), width: 26, height: 26,),),
      Spacer(),
      InkWell(onTap: () {},child: Image(image: AssetImage('assets/images/icons8-coin-96.png'), width: 26, height: 26,),),
      Spacer(),
      InkWell(onTap: () {},child: Image(image: AssetImage('assets/images/icons8-cog-96.png'), width: 26, height: 26,),),
    ]).box.make().p(36);
  }
}


class GridSections extends StatelessWidget {
  const GridSections({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack([
      HStack([
        VxBox(child: VStack([
          HStack([
            HStack([
              Icon(HeroIcons.check_circle, color: Colors.white,),
              SizedBox(width: 8,),
              Text('Done').text.medium.capitalize.color(Vx.white).make()
            ]),
            Spacer(),
            Text('2').text.xl.medium.capitalize.color(Vx.white).make()
          ]),
          Spacer(),
          HStack([
            VStack([
              // Text('Completed',).text.sm.color(Vx.white.withOpacity(.5)).make(),
              Text('Project presentation',).text.sm.color(Vx.white).make()
            ]).w(context.percentWidth * 26),
            Spacer(),
            IconButton.filled(onPressed: (){}, icon: Icon(EvaIcons.plus), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(matBlue)),)
          ])
          
        ])).padding(EdgeInsets.all(12)).roundedLg.height(context.percentHeight * 16).width(context.percentWidth * 47).color(matBlack).make(),
        Spacer(),
        VxBox(child: VStack([
          HStack([
            HStack([
              Icon(HeroIcons.check_circle, color: Colors.white,),
              SizedBox(width: 8,),
              Text('Pending').text.medium.capitalize.color(Vx.white).make()
            ]),
            Spacer(),
            Text('7').text.xl.medium.capitalize.color(Vx.white).make()
          ]),
          Spacer(),
          HStack([
            VStack([
              // Text('Completed',).text.sm.color(Vx.white.withOpacity(.5)).make(),
              Text('Checking my wallets',).text.sm.color(Vx.white).make()
            ]).w(context.percentWidth * 26),
            Spacer(),
            IconButton.filled(onPressed: (){}, icon: Icon(EvaIcons.edit_outline, color: Vx.white,), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),)
          ])

        ])).padding(EdgeInsets.all(12)).roundedLg.height(context.percentHeight * 16).width(context.percentWidth * 47).color(matBlack).make()
      ]),
      SizedBox(height: 2,),
      HStack([
        VxBox(child: VStack([
          HStack([
            HStack([
              Icon(EvaIcons.phone_call_outline, color: Colors.white,),
              SizedBox(width: 8,),
              Text('calls').text.medium.capitalize.color(Vx.white).make()
            ]),
            Spacer(),
            Text('4').text.xl.medium.capitalize.color(Vx.white).make()
          ]),
          Spacer(),
          HStack([
            VStack([
              // Text('Completed',).text.sm.color(Vx.white.withOpacity(.5)).make(),
              // Text('Project presentation',).text.sm.color(Vx.white).make()
              AvatarStack(
                height: 30,
                avatars: [
                  for (var n = 0; n < 15; n++)
                    NetworkImage('https://i.pravatar.cc/150?img=$n'),
                ],
              ),
              Spacer(),
              VStack([
                Text("10:30 - FaceTime").text.color(Vx.white).sm.make(),
                Text("company strategy").text.semiBold.uppercase.maxLines(1).color(Vx.white.withOpacity(.5)).sm.make()
              ])
            ]).w(context.percentWidth * 36).h(context.percentHeight * 11),

          ])

        ])).padding(EdgeInsets.all(12)).roundedLg.height(context.percentHeight * 18).width(context.percentWidth * 47).color(matBlack).make(),
        Spacer(),
        VxBox(child: VStack([
          HStack([
            HStack([
              Icon(BoxIcons.bx_pin, color: Colors.white,),
              SizedBox(width: 8,),
              Text('Trips').text.medium.capitalize.color(Vx.white).make()
            ]),
            Spacer(),
            Text('3').text.xl.medium.capitalize.color(Vx.white).make()
          ]),
          Spacer(),

            VStack([
              // Text('Completed',).text.sm.color(Vx.white.withOpacity(.5)).make(),
              // Text('Checking my wallets',).text.sm.color(Vx.white).make(),
              Text('12.6KM - NY, Down Town').text.sm.center.color(Vx.white).make().objectCenter(),
              SizedBox(height: 5,),
              FilledButton(onPressed: (){}, child: HStack([ Icon(EvaIcons.map_outline), SizedBox(width: 5,), Text('Show on Map').text.sm.color(Vx.white).make() ]), style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
                backgroundColor: MaterialStatePropertyAll(matGray),
                minimumSize: MaterialStatePropertyAll(Size(context.percentWidth * 50, 50))
              ),)
            ]),




        ])).padding(EdgeInsets.all(12)).roundedLg.bgImage(DecorationImage(image: AssetImage('assets/images/map.png'), fit: BoxFit.fill, colorFilter: ColorFilter.mode(matBlack, BlendMode.multiply))).height(context.percentHeight * 18).width(context.percentWidth * 47).color(matBlack).make()
      ])

    ]).pSymmetric(h: 8, v: 2);
  }
}


class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: VStack([
          HStack([
            HStack([
              Icon(BoxIcons.bx_notepad, color: Vx.white,),
              Text("My Tasks").text.lg.semiBold.color(Vx.white).make().pLTRB(8, 8, 0, 0),
            ]).px(10),
            Spacer(),
            HStack([
              Text("9").text.xl4.semiBold.color(Vx.white).make(),

              Text("AVAILABLE").text.sm
                  .semiBold.color(Vx.white.withOpacity(.8)).make().pLTRB(8, 0, 0, 0),
            ]).px(10)
          ]),

          Spacer(),

          HStack([

            VxCapsule(child: Text('HIGH').text.semiBold.make().objectCenter(), backgroundColor: matBlue, width: context.percentWidth * 30, height: 28,),
            Spacer(),
            VxCapsule(child: Text('MID').text.semiBold.color(Vx.white).make().objectCenter(), backgroundColor: matBlue.withOpacity(.4), width: context.percentWidth * 30, height: 28,),
            Spacer(),
            VxCapsule(child: Text('LOW').text.semiBold.color(Vx.white).make().objectCenter(), backgroundColor: matBlue.withOpacity(.2), width: context.percentWidth * 30, height: 28,)
          ]),

          Spacer(),

          HStack([
            VxBox(
              child: VStack([
                VStack([
                  Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                  Text('Project presentation').text.size(5).semiBold.color(Vx.white).make(),
                ]),
                SizedBox(height: 20,),
                VStack([
                  Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                  Text('Financial Department').text.size(5).semiBold.color(Vx.white).make(),
                ]),
              ])
            ).padding(EdgeInsets.only(left: 10)).width(context.percentWidth * 30).make(),

            Spacer(),
            VxBox(
                child: VStack([
                  VStack([
                    Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                    Text('Going to the gym').text.size(5).semiBold.color(Vx.white).make(),
                  ]),
                  SizedBox(height: 20,),
                  VStack([
                    Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                    Text('Report on alexandar').text.size(5).semiBold.color(Vx.white).make(),
                  ]),
                ])
            ).padding(EdgeInsets.only(left: 10)).width(context.percentWidth * 30).make(),

            Spacer(),
            VxBox(
                child: VStack([
                  VStack([
                    Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                    Text('Weekly Scheduling').text.size(5).semiBold.color(Vx.white).make(),
                  ]),
                  SizedBox(height: 20,),
                  VStack([
                    Text('14:00 - 15:00').text.size(10).semiBold.color(Vx.white.withOpacity(.5)).make(),
                    Text('Checking my wallets').text.size(5).semiBold.color(Vx.white).make(),
                  ]),
                ])
            ).padding(EdgeInsets.only(left: 10)).width(context.percentWidth * 30).make(),



          ]).pLTRB(0, 0, 0, 0),
          SizedBox(height: 20,),
          Spacer(),
          GestureDetector(
            child: Icon(EvaIcons.arrowhead_down_outline, color: Vx.white, size: 24,),
          ).objectCenter()
        ])
    ).padding(EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10)).roundedLg.height(context.percentHeight * 36).color(matBlack).make().pLTRB(6, 2, 6, 0);
  }
}


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return VxCapsule(
      backgroundColor: Vx.hexToColor("#0f0f11"),
      child: VxBox(
        child: TextField(
          cursorColor: Vx.white,
          decoration: InputDecoration(
              prefixIcon: Icon(BoxIcons.bx_search, color: Vx.white,),
              hintText: 'Type to start searching...',
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),

              hintStyle: TextStyle(color: Vx.white.withOpacity(.5), fontSize: 14)
          ),
        ),
      ).width(context.percentWidth * 65).make().objectCenter(),
    ).pLTRB(6, 2, 6, 0).h(60);
  }
}


class RecapView extends StatelessWidget {
  const RecapView({super.key});

  @override
  Widget build(BuildContext context) {
    return  VxBox(
        child: VStack([
          HStack(
            [
              Text("Today's Recap").text.xl2.semiBold.color(Vx.white).make(),
              Spacer(),
              Icon(BoxIcons.bx_dots_horizontal_rounded, color: Vx.white,)
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),

          Spacer(),

          HStack([
            Briefing(count: 9, title: 'Tasks', text: 'scheduled',),
            Spacer(),
            Briefing(count: 4, title: 'calls', text: 'contacts',),
            Spacer(),
            Briefing(count: 3, title: 'trips', text: 'online',),
          ])
        ])
    ).padding(EdgeInsets.all(30)).roundedLg.height(context.percentHeight * 24).bgImage(DecorationImage(image: AssetImage('assets/images/pattern.png'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(matBlack, BlendMode.multiply))).color(matBlack).make().pLTRB(6, 6, 6, 0);
  }
}


class Briefing extends StatelessWidget {
  const Briefing({super.key, required this.count, required this.title, required this.text});

  final int count;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return VStack([
      HStack([
        Text(count.toString()).text.xl3.fontFamily('Space Grotesk').color(matBlue).semiBold.make(),
        SizedBox(width: 6,),
        Text(title.capitalized).text.fontFamily('Space Grotesk').color(Vx.white).semiBold.make().objectBottomLeft().pLTRB(0, 6, 0, 0)
      ], ),
      Text(text.toUpperCase()).text.size(12).fontFamily('Space Grotesk').color(Vx.white.withOpacity(.6)).semiBold.make(),
    ]);
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size,) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0008333,size.height*-0.0028571);
    path_0.lineTo(size.width,size.height*-0.0013223);
    path_0.lineTo(size.width,size.height*0.8568286);
    path_0.quadraticBezierTo(size.width*0.7075000,size.height*0.8572714,size.width*0.5691667,size.height*0.8569429);
    path_0.quadraticBezierTo(size.width*0.5339583,size.height*0.8569429,size.width*0.5000000,size.height*0.9892857);
    path_0.quadraticBezierTo(size.width*0.4689583,size.height*0.8570429,size.width*0.4300000,size.height*0.8570429);
    path_0.quadraticBezierTo(size.width*0.3156250,size.height*0.8558857,size.width*-0.0025000,size.height*0.8553000);

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

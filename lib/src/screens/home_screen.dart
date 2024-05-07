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
      backgroundColor: greyMilk,
      appBar: AppBar(backgroundColor: blueBlack, surfaceTintColor: greyMilk, shadowColor: greyMilk, foregroundColor: greyMilk, elevation: 0, title: Text('Scan Code').text.bold.lg.make(), actions: [
        Icon(Icons.notifications_outlined),
        SizedBox(width: 10,),
        Icon(Iconsax.crown_1_outline),


      ],),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: Transform.translate(offset: Offset(0, 15), child: FloatingActionButton(onPressed: (){}, elevation: 10, foregroundColor: babyBlue,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), backgroundColor: babyBlue, mini: false, child: Icon(Icons.document_scanner_outlined, color: Colors.white, size: 28,),),) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: context.percentHeight * 25,
              collapsedHeight: context.percentHeight * 20,
              floating: true,
              flexibleSpace: SafeArea(child: RecapView())
            ),
            SliverList.list(children: [

            ])
          ],
        ),
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
      InkWell( onTap: () {}, child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Image(image: AssetImage('assets/images/icons8-calendar-96.png'), width: 26, height: 26,),
      ),),
      Spacer(),
      InkWell(onTap: () {},child: Image(image: AssetImage('assets/images/icons8-coin-96.png'), width: 26, height: 26,),),
      Spacer(),
      InkWell(onTap: () {},child: Image(image: AssetImage('assets/images/icons8-cog-96.png'), width: 26, height: 26,),),
    ]).box.p32.topRounded(value: 30).color(blueBlack).make();
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

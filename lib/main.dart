import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_code/src/screens/home_screen.dart';
import 'package:quick_code/src/screens/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:velocity_x/velocity_x.dart';
part 'main.g.dart';

Color greenTouch = Vx.hexToColor('#788154');
Color matYellow = Vx.hexToColor("#fff6db");

@riverpod
class MusicSlider extends _$MusicSlider {
  @override
  double build() => 0.0;

  void setSlide(double value) => state = value;
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home-screen', builder: (context, state) => const HomeScreen()),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Space Grotesk',
          textTheme: const TextTheme(
              titleSmall: TextStyle(fontFamily: 'Space Grotesk'))),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:quick_code/screens/splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_code/screens/homepage.dart';
part 'models/providers/main.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
String helloMoon(HelloMoonRef ref) {
  return 'Hello Moon';
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: '/home-screen', builder: (context, state) => const Homepage()),
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
              titleSmall: TextStyle(fontFamily: 'Corsa Grotesk'))),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

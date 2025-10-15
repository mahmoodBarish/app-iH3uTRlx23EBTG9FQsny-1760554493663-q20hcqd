import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/frame2147225408.dart';
import 'screens/h1ome.dart';
import 'screens/points.dart';
import 'screens/followers.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/frame_2147225408',
  routes: [
    GoRoute(
      path: '/frame_2147225408',
      builder: (BuildContext context, GoRouterState state) {
        return const Frame2147225408();
      },
    ),
    GoRoute(
      path: '/1_home',
      builder: (BuildContext context, GoRouterState state) {
        return const H1ome();
      },
    ),
    GoRoute(
      path: '/points',
      builder: (BuildContext context, GoRouterState state) {
        return const Points();
      },
    ),
    GoRoute(
      path: '/followers',
      builder: (BuildContext context, GoRouterState state) {
        return const Followers();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Production App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

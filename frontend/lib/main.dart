import 'package:flutter/material.dart';
import 'package:frontend/pages/bottom_tabs.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/signin.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 245, 244, 239),
      ),
    );
  }

  final _router = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(path: "/home", builder: (context, state) => TabScreen()),
      GoRoute(path: "/signin", builder: (context, state) => SigninPage()),
      GoRoute(path: "/register", builder: (context, state) => RegisterPage()),


    ]);
}

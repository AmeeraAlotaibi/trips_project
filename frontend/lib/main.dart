import 'package:flutter/material.dart';
import 'package:frontend/pages/bottom_tabs.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/pages/user_trips_lists.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/providers/profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider<ProfileProvider>(
        create: (_) => ProfileProvider(),
      ),
    ],
    child: MyApp(),
  ));
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
        // to change icon color theme when focused in text fields
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF5B8A72),
            ),
      ),
    );
  }

  final _router = GoRouter(initialLocation: "/signin", routes: [
    GoRoute(path: "/home", builder: (context, state) => TabScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterPage()),
    GoRoute(path: "/signin", builder: (context, state) => SigninPage()),
    GoRoute(path: "/user-lists", builder: (context, state) => UserListsPage()),
  ]);
}

// Hello
import 'package:flutter/material.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/pages/add_trip.dart';
import 'package:frontend/pages/bottom_tabs.dart';
import 'package:frontend/pages/edit_profile.dart';
import 'package:frontend/pages/edit_trip.dart';
import 'package:frontend/pages/favorites_list.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/pages/trip_details.dart';
import 'package:frontend/pages/user_profile.dart';
import 'package:frontend/pages/user_trips_lists.dart';
import 'package:frontend/pages/wantTo_list.dart';
import 'package:frontend/providers/auth_provider.dart';

import 'package:frontend/providers/trip_provider.dart';

import 'package:frontend/providers/profile_provider.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider<TripProvider>(
        create: (_) => TripProvider(),
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
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 244, 239),
        // to change icon color theme when focused in text fields
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF5B8A72),
            ),
      ),
    );
  }

  final _router = GoRouter(initialLocation: "/signin", routes: [
    GoRoute(path: "/home", builder: (context, state) => TabScreen()),
    GoRoute(path: "/register", builder: (context, state) => RegisterPage()),
    GoRoute(path: "/signin", builder: (context, state) => SigninPage()),
    GoRoute(
        path: "/edit-trip",
        builder: (context, state) => EditTrip(
              trip: state.extra as Trip,
            )),
    GoRoute(
        path: "/user-lists",
        builder: (context, state) =>
            UserListsPage(trips: state.extra as List<Trip>)),
    GoRoute(
        path: "/my-favorites",
        builder: (context, state) =>
            FavoritesPage(favs: state.extra as List<int>)), // change this later
    GoRoute(
        path: "/my-want-to",
        builder: (context, state) =>
            WantToPage(wants: state.extra as List<int>)), // change this later
    GoRoute(
        path: "/edit-profile", builder: (context, state) => EditProfilePage()),
    GoRoute(path: "/add-trip", builder: (context, state) => AddTrip()),
    GoRoute(
        path: "/trip-details",
        builder: (context, state) => TripDetailsPage(
              trip: state.extra as Trip,
            )),
    GoRoute(
      path: "/user-profile",
      builder: (context, state) => UserProfilePage(
        // user: state.extra as Profile,
        id: state.extra as int,
      ),
    ), // change this later
  ]);
}

// Hello
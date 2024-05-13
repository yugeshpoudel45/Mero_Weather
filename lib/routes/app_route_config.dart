import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mero_weather/pages/demo2.dart';
import 'package:mero_weather/pages/demo_home.dart';
import 'package:mero_weather/pages/homepage.dart';
import 'package:mero_weather/routes/app_route_constant.dart';

class MeroAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.helpScreen,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: HelpScreen()),
      ),
      GoRoute(
        name: MyAppRouteConstants.homePage,
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
    ],
  );
}

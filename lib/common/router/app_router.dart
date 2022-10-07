import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifighting_mobile/home/home_page.dart';
import 'package:qualifighting_mobile/login/login_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: HomePage),
  ],
)
class AppRouter extends _$AppRouter {}

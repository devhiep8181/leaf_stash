import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/home/page/home_screen.dart';
import '../presentation/splash/page/splash_screen.dart';
import 'name_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/$splashRoute',
    routes: [
      ShellRoute(
          builder: (context, state, child) {
            return SafeArea(child: child);
          },
          routes: [
            GoRoute(
              name: splashRoute,
              path: '/$splashRoute',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return _buildTransition(
                    state: state, screen: const SplashScreen());
              },
              routes: [
                GoRoute(
                  name: homeRoute,
                  path: homeRoute,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return _buildTransition(
                        state: state, screen: const HomeScreen());
                  },
                ),
              ],
            ),
          ]),
    ]);

CustomTransitionPage<void> _buildTransition(
    {required GoRouterState state, required Widget screen}) {
  return CustomTransitionPage<void>(
    //key: state.pageKey,
    child: screen,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

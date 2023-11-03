import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_flutter/views/async_notifier_screen/async_notifier_screen.dart';
import 'package:sample_flutter/views/family_screen/family_screen.dart';
import 'package:sample_flutter/views/future_screen/future_screen.dart';
import 'package:sample_flutter/views/hello_world_screen/hello_world_screen.dart';
import 'package:sample_flutter/views/home_screen.dart';
import 'package:sample_flutter/views/notifier_screen/notifier_screen.dart';
import 'package:sample_flutter/views/stream_screen/stream_screen.dart';

part 'router.g.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(path: '/', routes: [
  TypedGoRoute<HelloWorldRoute>(path: 'hello_world'),
  TypedGoRoute<NotifierRoute>(path: 'notifier'),
  TypedGoRoute<FamilyRoute>(path: 'family'),
  TypedGoRoute<FutureRoute>(path: 'future'),
  TypedGoRoute<AsyncNotifierRoute>(path: 'async_notifier'),
  TypedGoRoute<StreamRoute>(path: 'stream'),
])

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class HelloWorldRoute extends GoRouteData {
  const HelloWorldRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HelloWorldScreen();
  }
}

class NotifierRoute extends GoRouteData {
  const NotifierRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotifierScreen();
  }
}

class FamilyRoute extends GoRouteData {
  const FamilyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FamilyScreen();
  }
}

class FutureRoute extends GoRouteData {
  const FutureRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FutureScreen();
  }
}

class AsyncNotifierRoute extends GoRouteData {
  const AsyncNotifierRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AsyncNotifierScreen();
  }
}

class StreamRoute extends GoRouteData {
  const StreamRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StreamScreen();
  }
}

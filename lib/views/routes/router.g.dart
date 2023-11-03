// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'hello_world',
          factory: $HelloWorldRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'notifier',
          factory: $NotifierRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'family',
          factory: $FamilyRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'future',
          factory: $FutureRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'async_notifier',
          factory: $AsyncNotifierRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'stream',
          factory: $StreamRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelloWorldRouteExtension on HelloWorldRoute {
  static HelloWorldRoute _fromState(GoRouterState state) =>
      const HelloWorldRoute();

  String get location => GoRouteData.$location(
        '/hello_world',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotifierRouteExtension on NotifierRoute {
  static NotifierRoute _fromState(GoRouterState state) => const NotifierRoute();

  String get location => GoRouteData.$location(
        '/notifier',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FamilyRouteExtension on FamilyRoute {
  static FamilyRoute _fromState(GoRouterState state) => const FamilyRoute();

  String get location => GoRouteData.$location(
        '/family',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FutureRouteExtension on FutureRoute {
  static FutureRoute _fromState(GoRouterState state) => const FutureRoute();

  String get location => GoRouteData.$location(
        '/future',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AsyncNotifierRouteExtension on AsyncNotifierRoute {
  static AsyncNotifierRoute _fromState(GoRouterState state) =>
      const AsyncNotifierRoute();

  String get location => GoRouteData.$location(
        '/async_notifier',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StreamRouteExtension on StreamRoute {
  static StreamRoute _fromState(GoRouterState state) => const StreamRoute();

  String get location => GoRouteData.$location(
        '/stream',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

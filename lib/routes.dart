import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state){
        final username = state.uri.queryParameters['username'];
        return HomePage(username!);
      },
    ),
    GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => LoginPage()
    )
  ],
);
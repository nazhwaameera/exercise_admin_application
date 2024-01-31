import 'package:exercise_admin_application/application/pages/createpage/create_page.dart';
import 'package:go_router/go_router.dart';

import 'application/pages/homepage/home_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter() : router = _configureRouter();

  static GoRouter _configureRouter() {
    return GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state){
               return HomePage();
            },
          ),
          GoRoute(
            name: 'create',
            path: '/create',
            builder: (context, state){
              return CreatePage();
            },
          ),
          GoRoute(
            name: 'user_list',
            path: '/user-list',
            builder: (context, state){
              return CreatePage();
            },
          ),
        ],
    );
  }
}

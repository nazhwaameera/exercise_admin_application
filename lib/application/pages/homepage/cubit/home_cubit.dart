import 'package:bloc/bloc.dart';
import 'package:exercise_admin_application/routes.dart';
import 'package:go_router/go_router.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRouter appRouter;

  HomeCubit(this.appRouter) : super(HomeInitial());

  void navigateToCreatePage() {
    appRouter.router.go('/create');
  }

  void navigateToUserListPage() {
    appRouter.router.go('/user-list');
  }
}

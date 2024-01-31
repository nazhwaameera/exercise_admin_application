import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // void navigateToCreatePage() {
  //   GoRouter.of(context).pushNamed('/create'); // Adjust the route based on your project setup
  // }
  //
  // void navigateToUserListPage() {
  //   GoRouter.of(context).pushNamed('/user-list'); // Adjust the route based on your project setup
  // }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_admin_application/domain/entities/user_entity.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListLoading());

  // Add methods for loading, deleting users, etc.

  void deleteUser(String userId) {
    // Add logic to delete user with id 'userId'
    // You can use a repository or any other method to perform the deletion

    // For example:
    // userRepository.deleteUser(userId);

    // After deletion, update the state
    // emit(UserListLoaded(users: updatedUserList));
  }
}

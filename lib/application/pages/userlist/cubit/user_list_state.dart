part of 'user_list_cubit.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserEntity> users;

  UserListLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserListError extends UserListState {
  final String errorMessage;

  UserListError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


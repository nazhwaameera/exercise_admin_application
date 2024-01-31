part of 'create_cubit.dart';

abstract class CreateCubitState extends Equatable {
  const CreateCubitState();

  @override
  List<Object> get props => [];
}

class CreateInitial extends CreateCubitState {}

class CreateLoading extends CreateCubitState {}

class CreateSuccess extends CreateCubitState {}

class CreateError extends CreateCubitState {
  final String errorMessage;

  CreateError({required this.errorMessage});
}

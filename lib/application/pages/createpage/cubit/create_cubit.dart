import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_admin_application/domain/entities/user_entity.dart';
import 'package:exercise_admin_application/domain/usecases/user_usecases.dart';
part 'create_state.dart';

class CreateCubit extends Cubit<CreateCubitState> {
  CreateCubit() : super(CreateInitial());

  final UserUseCases userUseCases = UserUseCases();
  
  String generateRandomId() {
    final characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final characterLength = characters.length;
    final random = Random();
    String result = '';
    for (int counter = 0; counter < 5; counter++) {
      result += characters[random.nextInt(characterLength)];
    }
    return result;
  }

  void submitForm({
    required String nama,
    required String tempat_tanggal_lahir,
    required String kabupaten,
    required String provinsi,
    required String pekerjaan,
    required String pendidikan,
  }) async {
    try {
      emit(CreateLoading());

      String generatedId = generateRandomId();

      UserEntity updatedFormData = UserEntity(
          id: generatedId,
          nama: nama,
          tempat_tanggal_lahir: tempat_tanggal_lahir,
          provinsi: provinsi,
          kabupaten: kabupaten,
          pekerjaan: pekerjaan,
          pendidikan: pendidikan
      );

      await userUseCases.createUserData(updatedFormData.toMap());
      emit(CreateSuccess());
    } catch (e) {
      emit(CreateError(errorMessage: 'Failed to submit the form.'));
    }
  }
}



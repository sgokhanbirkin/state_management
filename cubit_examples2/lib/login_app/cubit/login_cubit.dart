import 'package:cubit_examples2/login_app/model/login_request_model.dart';
import 'package:cubit_examples2/login_app/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formkey;

  final TextEditingController emaillerController;
  final TextEditingController paswordController;

  final ILoginService service;

  bool isLoginFail = false;
  bool isLoading = false;

  LoginCubit({
    required this.formkey,
    required this.emaillerController,
    required this.paswordController,
    required this.service,
  }) : super(LoginInitial());

  Future<void> postUserData() async {
    print('Post User Data');
    if (formkey.currentState?.validate() ?? false) {
      print('**************************FORM VALİADE ????????????????????');
      changeLoading();
      final data = await service.postUserData(
        LoginRequestModel(
          email: emaillerController.text,
          password: paswordController.text,
        ),
      );
      changeLoading();
      if (data is LoginResponseModel) {
        emit(LoginCompleted(data));
      } else {
        isLoginFail = true;
        emit(LoginValidate(isLoginFail));
      }

      changeLoading();
      emit(LoginError());
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading));
  }
}

import 'dart:io';

import 'package:dio/dio.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  final loginPath = ILoginServicePath.login.rawValue;

  Future<LoginResponseModel?> postUserData(LoginRequestModel model);
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> postUserData(LoginRequestModel model) async {
    print('loginPath : $loginPath');
    print('Model : ${model.toJson()}');
    try {
      final response = await dio.post(loginPath, data: model);
      print('RESPONSE : ${response.data}');
      if (response.statusCode == HttpStatus.ok) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

enum ILoginServicePath { login }

extension IloginServicePAthExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.login:
        return '/login';
    }
  }
}

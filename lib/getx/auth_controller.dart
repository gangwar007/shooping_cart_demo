
import 'package:demo_test/api/api.dart';
import 'package:demo_test/model/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';




class AuthController extends GetxController {
  ApiRepository apiRepository;

  AuthController({required this.apiRepository});

  final loginUserController = TextEditingController();
  final loginPasswordController = TextEditingController();

  Future login() async {
    var loginRequest = LoginRequest(
        username: loginUserController.text,
        password: loginPasswordController.text);
    EasyLoading.show();
    final res = await apiRepository.login(loginRequest.toJson());
    if (res != null) {
      GetStorage().write('isLogin', true);
      EasyLoading.dismiss();
    }
  }

}
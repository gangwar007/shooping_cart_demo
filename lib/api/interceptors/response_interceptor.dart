import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';


FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  debugPrint('request. header  ${request.url} ${request.headers}');
  debugPrint('statusCode  of ${request.url} is ${response.statusCode}');

  if (response.statusCode == 200 || response.statusCode == 204) {
    return response;
  }
  handleErrorStatus(response);
  return;
}

Future<void> handleErrorStatus(Response response) async {
  EasyLoading.dismiss();
  switch (response.statusCode) {
    case 400:
      // final message = ErrorResponse.fromJson(response.body);
      // CommonWidget.toast(message.message.toString());
      break;
    case 403:
      // final message = ErrorResponse.fromJson(response.body);
      // CommonWidget.toast(message.message.toString());
      break;
    case 401:
     /* if (Preference.currentRoute != RoutesName.login && Preference.getBool(Preference.isUserLogin,def: false) ) {
          EasyLoading.dismiss();
          CommonWidget.toast('your session has been expired. please login again');
          Preference.toTakeRoute=null;
          Preference.toTakeTab=null;
          Preference.clearPref();
          Get.find<DashBoardController>().careCircleResponseBox.clear();
          Get.find<AuthController>().userResponseBox.clear();

          isLoginTry=false;
          Get.reloadAll(force: true);
          (Router.of(Get.context!).routerDelegate as MyRouterDelegate).myRoute =
              RoutesName.login;


      } else {
        final message = ErrorResponse.fromJson(response.body);
        CommonWidget.toast(message.message.toString());
      }*/
      break;
    case 404:
     /* final message = ErrorResponse.fromJson(response.body);

      if (message.message!.toLowerCase().contains('Verification code'.toLowerCase())) {
        CommonWidget.toast(message.message.toString());
      }

      if (message.message.toString().toLowerCase().contains("profile not found".toLowerCase()) ||
          message.message.toString().toLowerCase().contains("Patient does not exist".toLowerCase()) ||
          message.message.toString().toLowerCase().contains("Patient ID is invalid".toLowerCase()) ||
          message.message.toString().toLowerCase().contains("Patient not found".toLowerCase())) {
        CommonWidget.showDialog(widget: CommonWidget.eligibilityCheckerDialogView(), messageCode: 2992, content: "");
      }*/
      break;
    case 409:
      // CommonWidget.toast('oops, something went wrong. Please refresh the page');
      break;
    default:
      // CommonWidget.toast('oops, something went wrong. Please try again later.');
      break;
  }
  return;
}

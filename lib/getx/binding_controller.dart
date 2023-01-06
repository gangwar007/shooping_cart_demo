import 'package:demo_test/getx/auth_controller.dart';
import 'package:demo_test/getx/product_controller.dart';
import 'package:get/get.dart';

import '../api/api_provider.dart';
import '../api/api_repository.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);

    Get.lazyPut<AuthController>(
            () => AuthController(apiRepository: Get.find()));

    Get.lazyPut<ProductController>(
            () => ProductController(apiRepository: Get.find()));
  }
}
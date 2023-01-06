import 'package:get/get.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {

  Future<Response> login(String path, Map<String, dynamic> data) {
    return post(path, data);
  }


  Future<Response> getProducts(String path) {
    return get(path);
  }

  Future<Response> getCategories(String path) {
    return get(path);
  }
}



import 'dart:async';
import 'dart:convert';

import 'package:demo_test/model/hive/cart_model.dart';

import '../model/login_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(Map<String, dynamic> data) async {

    try{
      final response = await apiProvider.login(ApiConstants.loginUrl, data);
      return LoginResponse.fromJson(response.body);
    }catch( error){
      rethrow;
    }
  }


  Future<List<Products>?> getProducts() async {
    try{
      final response = await apiProvider.getProducts(ApiConstants.products);
      return productResponseFromJson(jsonEncode(response.body));
    }catch( error){
      rethrow;
    }
  }


  Future<List<dynamic>?> getCategories() async {
    try{
      final response = await apiProvider.getCategories(ApiConstants.categories);
      return response.body;
    }catch( error){
      rethrow;
    }
  }


}

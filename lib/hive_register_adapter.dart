import 'package:demo_test/model/hive/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';



class HiveBoxConstants {
  static const String cartModel = "cartModel";
  static const String productModel = "products";

}

class HiveRegisterAdapter {
  static registerAdapters() {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ProductsAdapter());
    Hive.registerAdapter(RatingAdapter());

  }

  static openBox() async {
    await Hive.openBox<User>(HiveBoxConstants.cartModel);
    await Hive.openBox<Products>(HiveBoxConstants.productModel);
  }
}
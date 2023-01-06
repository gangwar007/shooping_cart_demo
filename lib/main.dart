import 'package:demo_test/getx/binding_controller.dart';
import 'package:demo_test/screens/home_screen.dart';
import 'package:demo_test/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

import 'hive_register_adapter.dart';
import 'model/hive/cart_model.dart';

final cartBox = Hive.box<User>(HiveBoxConstants.cartModel);
final products = Hive.box<Products>(HiveBoxConstants.productModel);

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  await GetStorage.init();
  await Hive.initFlutter();
  HiveRegisterAdapter.registerAdapters();
  await HiveRegisterAdapter.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // GetStorage().write('isLogin', false);

    return GetMaterialApp(
      initialBinding: BindingController(),
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home:  GetStorage().hasData('isLogin') && GetStorage().read('isLogin')  ? const HomeScreen(): const LoginScreen() ,
    );
  }
}

void configLoading() {/**/

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 20.0
    ..maskType= EasyLoadingMaskType.black
    ..boxShadow = <BoxShadow>[]
    ..backgroundColor = Colors.grey.withOpacity(0.5)
    ..indicatorColor = Colors.blue
    ..textColor = Colors.lightBlue
    ..userInteractions = false
    ..dismissOnTap = false;

}


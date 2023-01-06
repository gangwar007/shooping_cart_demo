import 'package:demo_test/getx/auth_controller.dart';
import 'package:demo_test/screens/custom_widget.dart';
import 'package:demo_test/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends GetView<AuthController>{
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Container(
               height: 400,
               decoration: const BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage('assets/background.jpg'),
                       fit: BoxFit.fill
                   )
               ),
               child: Container(
                 margin: const EdgeInsets.only(top: 50),
                 child: const Center(
                   child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Column(
                 children: <Widget>[
                   Container(
                     padding: const EdgeInsets.all(5),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: const [
                           BoxShadow(
                               color: Color.fromRGBO(143, 148, 251, .2),
                               blurRadius: 20.0,
                               offset: Offset(0, 10)
                           )
                         ]
                     ),
                     child: Column(
                       children: <Widget>[
                         Container(
                           padding: const EdgeInsets.all(8.0),
                           decoration: BoxDecoration(
                               border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                           ),
                           child: TextField(
                             controller: controller.loginUserController,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: "User name",
                                 hintStyle: TextStyle(color: Colors.grey[400])
                             ),
                           ),
                         ),
                         Container(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                             controller: controller.loginPasswordController,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: "Password",
                                 hintStyle: TextStyle(color: Colors.grey[400])
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                   const SizedBox(height: 30,),
                   GestureDetector(
                     onTap: (){
                       if(controller.loginUserController.text.isEmpty && controller.loginPasswordController.text.isEmpty){
                         showSnackBar(title: 'Error', message: 'Please enter user name and password');
                       }else{
                         controller.login().then((value){
                           GetStorage().write('username', controller.loginUserController.text);
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                           const HomeScreen()), (Route<dynamic> route) => false);
                         });
                       }
                     },
                     child: Container(
                       height: 50,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           gradient: const LinearGradient(
                               colors: [
                                 Colors.blue,
                                 Colors.blueAccent,
                               ]
                           )
                       ),
                       child: const Center(
                         child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                       ),
                     ),
                   ),
                 ],
               ),
             )
           ],
         ),
       )
   );
  }
}
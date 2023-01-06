import 'package:demo_test/screens/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../getx/product_controller.dart';
import '../main.dart';

class CartScreen extends GetView<ProductController>{
   const CartScreen({super.key});

   @override
  Widget build(BuildContext context) {
      controller.productList.value = products.values.toList();
    controller.cartTotalPrice();
     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: const Text('My Shopping Cart'),
         actions: [
           cartIcon(controller)
         ],
       ),
       body: Column(
         children: [
          ValueListenableBuilder(valueListenable: products.listenable(),
             builder: (context, value, child) {
                 return  value.isEmpty ?  const Center(
                     child: Text(
                       'Your Cart is Empty',
                       style:
                       TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                     )):  Expanded(
                     child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: value.length,
                         itemBuilder: (context, index) {
                           var personData = value.getAt(index)!;
                           return Card(
                             color: Colors.white,
                             elevation: 5.0,
                             child: Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisSize: MainAxisSize.max,
                                 children: [
                                   Image.network(width: 80,height: 80,personData.image??''),
                                   Expanded(
                                     child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         const SizedBox(
                                           height: 5.0,
                                         ),
                                         Text(personData.title??'', style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                         Row(
                                           children: [

                                             Expanded(child:  Text('\$${personData.price}')),
                                             IconButton(onPressed: () {
                                               controller.productList.removeAt(index);
                                               controller.update();
                                               controller.removeFromCart(index);
                                             }, icon: const Icon(Icons.delete))
                                           ],
                                         )

                                       ],
                                     ),
                                   ),


                                 ],
                               ),
                             ),
                           );
                         }));
               },)
         ],
       ),
       bottomNavigationBar: Container(
         color: Colors.white24,
         alignment: Alignment.center,
         height: 50.0,
         child:  Padding(
           padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
           child: Obx(() =>  Row(
               children: [
                 const Expanded(child: Text(
                   'Totla Price',
                   style: TextStyle(
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),),
                 Text(
                   '\$${controller.total}',
                   style: const TextStyle(
                     fontSize: 18.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
           ),
         )
       ),
     );
   }
}
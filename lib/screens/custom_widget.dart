import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/product_controller.dart';
import 'cart_list_screen.dart';

Widget cartIcon(ProductController productController) {
  return Obx(() =>  Stack(
      children: [
        IconButton(
            onPressed: () {
              Get.to(() =>  const CartScreen());
            },
            icon: const Icon(Icons.shopping_cart)),
        if (productController.cartLength.value != 0 )
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: Colors.black87, shape: BoxShape.circle),
              child: Center(child: Text('${productController.cartLength.value}',)),
            ),
          )
      ],
    ),
  );
}

showSnackBar(
    {required title,
      required message,
      Duration? duration,
      position = SnackPosition.BOTTOM}) {
  Get.snackbar(title, message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: position,
      duration: duration ?? const Duration(seconds: 3));
}
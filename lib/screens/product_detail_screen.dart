import 'package:demo_test/model/hive/cart_model.dart';
import 'package:demo_test/screens/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../getx/product_controller.dart';
import '../main.dart';


class ProductDetailScreen extends StatelessWidget {

  ProductDetailScreen( this.productResponse, {Key? key}) : super(key: key);

  final Products productResponse;
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context){
    productController.productList.value = products.values.toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
         cartIcon(productController)
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            padding: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productResponse.image??''),
                  fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productResponse.category??'',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                productResponse.title??'',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  textStyle: const TextStyle(),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '\$${productResponse.price??''}',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          productResponse.description??'',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.blueAccent,
                            ]
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              InkWell(
                onTap: () {
                  productController.selectedProduct = productResponse;
                  productController.addToCart();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:Text(
                    '+ Add to Cart',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ), /*Obx(
                        () => *//*productController.isAddLoading.value
                        ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                        :*//* Text(
                      '+ Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
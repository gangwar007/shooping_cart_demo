import 'package:demo_test/main.dart';
import 'package:demo_test/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/product_controller.dart';
import 'custom_widget.dart';

class HomeScreen extends GetView<ProductController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   controller.getCategories().then((value) => controller.getProducts() );
   controller.cartLength.value = products.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue,
       title: const Text('Shopping Store'),
        actions: [
           Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                key: UniqueKey(),
                onChanged: (value) {
                  if (value.length >= 3) {
                    controller.searchList(value);
                  }else if(value.isEmpty){
                    controller.uniqueItemsList.value = controller.productResponse;
                  }
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                  cursorColor: Colors.white,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    hintStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
          ),
              cartIcon(controller),
        ],
      ),
      body: Obx(() =>  Column(
        children: [
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children:  List<Widget>.generate(controller.categoryResponse.length, (index){
             return  Padding(
               padding: const EdgeInsets.all(5.0),
               child: FilterChip(
                 selectedColor: Colors.lightBlue,
                  selected: controller.filterData.contains(controller.categoryResponse[index]),
                 label: Text(controller.categoryResponse[index]), onSelected: (value) {

                 if(controller.filterData.contains(controller.categoryResponse[index])) {
                   controller.filterData.remove(controller.categoryResponse[index]);
                 }else{
                   controller.filterData.add(
                       controller.categoryResponse[index]);
                 }
                 controller.uniqueItemsList.value = controller.productResponse;
                 controller.uniqueItemsList.value= controller.uniqueItemsList.where((x) => controller.filterData.contains(x.category)).toList();

                 if(controller.uniqueItemsList.isEmpty){
                   controller.uniqueItemsList.value = controller.productResponse;
                 }
                 controller.uniqueItemsList.refresh();
               }),
             );
           })),
         ),

          Expanded(
            child: Obx(() => GridView.builder(
              shrinkWrap: true,
              itemCount: controller.uniqueItemsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.79),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => ProductDetailScreen(controller.uniqueItemsList[index]));
                  },
                  child: Stack(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 170,
                              width: Get.width,
                              decoration:  BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: NetworkImage(controller.uniqueItemsList[index].image??''),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, top: 10),
                              child: Text(controller.uniqueItemsList[index].title??'', style: const TextStyle(overflow: TextOverflow.ellipsis),),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text('\$${
                                  controller.uniqueItemsList[index].price.toString()
                              }'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ),
          ),
        ],
      ),
      ),

    );
  }
}
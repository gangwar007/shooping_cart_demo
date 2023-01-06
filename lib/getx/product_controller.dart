import 'package:demo_test/api/api.dart';
import 'package:demo_test/model/hive/cart_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../screens/custom_widget.dart';


class ProductController extends GetxController {
  ApiRepository apiRepository;

   ProductController({required this.apiRepository});


  var isAddedToCart = false.obs;
  var cartLength = 0.obs;
  var selectedProduct = Products();
  var productList = <Products>[].obs;
  var total=0.0.obs;
  var productResponse = <Products>[].obs;
  var uniqueItemsList = <Products>[].obs;
  var categoryResponse = <dynamic>[].obs;
  var filterData = <String>[].obs;





  /*   Get Categories data */
  Future getCategories() async {
    EasyLoading.show();
    final res = await apiRepository.getCategories();
    if (res != null) {
      categoryResponse.value = res;
    }
  }


  /*   Get Products data */
  Future getProducts() async {
    final res = await apiRepository.getProducts();
    if (res != null) {
      productResponse.value = res;
      uniqueItemsList.value=res;
      EasyLoading.dismiss();
    }
  }

  addToCart() async {
    productList.clear();
    var existingItem = products.values.firstWhere((itemToCheck) => itemToCheck.title == selectedProduct.title, orElse: () => Products());
    if (existingItem.title != selectedProduct.title) {
      products.add(selectedProduct);
      cartLength.value = products.length;
      cartTotalPrice();
      isAddedToCart.value = true;
    } else {
      showSnackBar(title: 'Opps', message: 'Product Already In Cart');
    }
  }

  removeFromCart(index) async {
    products.deleteAt(index);
    cartTotalPrice();
    cartLength.value = products.length;
  }

   cartTotalPrice(){
    total.value = 0.0;
    for (var item in products.values) { total.value += item.price!; }
  }

  searchList(String query){
    uniqueItemsList.value = productResponse.where((p0){
      return p0.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    update();
  }

}
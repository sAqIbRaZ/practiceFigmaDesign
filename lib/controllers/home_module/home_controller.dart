import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isSearching = false.obs;

  startSearchingFunction() {
    isSearching.value = true;
  }

  stopSearchingFunction() {
    isSearching.value = false;
  }

  ///
  ///
  ///
  /// select serving in food detail screen
  ///
//

  RxInt selectedServing = 0.obs;

  void selectedServingFunction(int value) {
    selectedServing.value = value;
  }

  RxBool isChilliSelected = false.obs;

  void isChiliSeclectedFunction(bool value) {
    isChilliSelected.value = value;
  }

  RxBool isMayoSelected = false.obs;

  void isMayoSeclectedFunction(bool value) {
    isMayoSelected.value = value;
  }

  RxBool ismushroomsSelected = false.obs;

  void isMushroomsSeclectedFunction(bool value) {
    ismushroomsSelected.value = value;
  }

  ///
  ///
  /// add or remove items quantity to cart
  ///
//
  RxInt itemQuantity = 01.obs;

  itemQuantityIncrement() {
    itemQuantity.value++;
  }

  itemQuantitydecrement() {
    if (itemQuantity.value != 0) {
      itemQuantity.value--;
    }
  }

  ///
  ///  is payment for card added or not
//

  RxBool isPaymentCardAdded = false.obs;

  void addPaymentCardFunction() {
    isPaymentCardAdded.value = true;
  }
  //
  ///  is payment for card added or not
//

  RxBool isItemsAddedToCart = false.obs;

  void ItemAddedToCartFuction() {
    isItemsAddedToCart.value = true;
  }

  ///
  ///
  /// show app bar title
//
  RxBool isAppBarClosed = false.obs;

  void showAppBarTitleFunction() {
    isAppBarClosed.value = true;
  }

  void hideAppBarTitleFunction() {
    isAppBarClosed.value = false;
  }
}

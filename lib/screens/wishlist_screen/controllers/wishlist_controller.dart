import 'package:get/get.dart';
import 'package:islamic_marriage/screens/wishlist_screen/models/wishlist.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class WishListController extends GetxController {
  bool isLoading = false;
  Wishlist? wishListItems;

  Future<void> getWishlist() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUser, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        // Parse the dynamic list into Wishlist
        final List<dynamic> favouriteListData =
            response.data['data']['favouriteLists'];
        wishListItems =
            Wishlist.fromJson({'favouriteLists': favouriteListData});
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }

  Future<void> removeFromWishlist(int id) async {
    try {
      final response = await ApiService().patchWithOutBody(
          url: '${AppUrls.addRemoveToFavouriteListUrl}/$id',
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Remove to wishlist');
        wishListItems!.favouriteLists!
            .removeWhere((element) => element.id == id);
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      update();
    }
  }

  Future<void> addToWishlist(int id) async {
    update();
    try {
      final response = await ApiService().patchWithOutBody(
          url: '${AppUrls.addRemoveToFavouriteListUrl}/$id',
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Add to wishlist');
        wishListItems!.favouriteLists!.add(Biodata(id: id)); // Add the item to the list
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      update();
    }
  }

  // Check if the product with the given id is in the wishlist
  bool isInWishlist(int id) {
    return wishListItems!.favouriteLists!.any((bioData) => bioData.id == id);
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final token = SharedPreferencesService().getToken();
    if (token.isNotEmpty) {
      getWishlist();
    }
  }

}

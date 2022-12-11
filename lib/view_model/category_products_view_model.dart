import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/model/products_model.dart';
import 'package:kortoba_assign/service/db.dart';
import '../data/response/api_response.dart';
import '../repositry/category_products_repositry.dart';
import '../view/auth/screens/login/login_screen.dart';

class CategoryProductViewModel with ChangeNotifier {
  final _categRepo = CategoryProductRepositry();
  ApiResponse<ProductsModel> productsList = ApiResponse.loading();
  List<dynamic> favoritesList = [];
  logout(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen()));
  }

  setFavoritesList(List<dynamic> favorites) {
    favoritesList = favorites;
    notifyListeners();
  }

  setProductsList(ApiResponse<ProductsModel> response) {
    productsList = response;
    notifyListeners();
  }

  Future<void> fetchProductsApi(id) async {
    print('productsss');
    await _categRepo.getProductsByCategory(id).then((value) {
      setProductsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setProductsList(ApiResponse.error(error.toString())));
  }

  fetchFavorites() async {
    await DB.instance.getFavorites().then((value) => setFavoritesList(value));
  }

  addToFavorites(Results productModel) async {
    FavoritesModel favoritesModel = FavoritesModel(
        catId: productModel.category.id,
        catImage: productModel.category.imageLink,
        catName: productModel.category.name,
        description: productModel.description,
        id: productModel.id,
        imageLink: productModel.imageLink,
        name: productModel.name,
        price: productModel.price,
        rate: productModel.rate);
    await DB.instance.insertFavorite(favoritesModel);
  }

  removeFavorite(id) async {
    await DB.instance.deleteFavorite(id);
  }
}

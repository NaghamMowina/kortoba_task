import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/categories_model.dart' as category;
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/model/products_model.dart' as product;
import 'package:kortoba_assign/service/db.dart';
import '../data/response/api_response.dart';
import '../repositry/home_repositry.dart';
import '../view/auth/screens/login/login_screen.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepositry();

  List<String> discounts = ['assets/images/cmen.png', 'assets/images/ADD.png'];
  ApiResponse<product.ProductsModel> productsList = ApiResponse.loading();
  ApiResponse<category.CategoriesModel> categoriesList = ApiResponse.loading();
  List<dynamic> favoritesList = [];
  logout(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen()));
  }

  setFavoritesList(List<dynamic> favorites) {
    favoritesList = favorites;
    notifyListeners();
  }

  setProductsList(ApiResponse<product.ProductsModel> response) {
    productsList = response;
    notifyListeners();
  }

  setCategoriesList(ApiResponse<category.CategoriesModel> response) {
    categoriesList = response;
    notifyListeners();
  }

  Future<void> fetchProductsApi() async {
    print('productsss');
    await _homeRepo.getProducts().then((value) {
      setProductsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setProductsList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchCategoriesApi() async {
    print('categoriessss');
    await _homeRepo.getCategories().then((value) {
      setCategoriesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setCategoriesList(ApiResponse.error(error.toString())));
  }

  fetchFavorites() async {
    await DB.instance.getFavorites().then((value) => setFavoritesList(value));
  }

  addToFavorites(product.Results productModel) async {
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

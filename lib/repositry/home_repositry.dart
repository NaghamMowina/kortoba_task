import 'package:http/http.dart' as http;
import 'package:kortoba_assign/model/categories_model.dart';

import '../data/network/network_api_service.dart';
import '../model/products_model.dart';
import '../res/app_url.dart';

class HomeRepositry {
  final NetworkApiServices _apiServices = NetworkApiServices();
  Future<ProductsModel> getProducts() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.products);
      print('responseProducts $response');

      return response = ProductsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CategoriesModel> getCategories() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.categories);
      print('responseCategories $response');

      return response = CategoriesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

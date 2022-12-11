import 'package:http/http.dart' as http;

import '../data/network/network_api_service.dart';
import '../model/products_model.dart';
import '../res/app_url.dart';

class CategoryProductRepositry {
  final NetworkApiServices _apiServices = NetworkApiServices();
  Future<ProductsModel> getProductsByCategory(id) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse('${AppUrl.products}category/$id');
      print('responseProducts $response');

      return response = ProductsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/model/products_model.dart';
import 'package:kortoba_assign/service/db.dart';
import 'package:kortoba_assign/view/home/categories/category_item.dart';
import 'package:kortoba_assign/view/home/products/product_item.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  State<ProductsListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<ProductsListView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchProductsApi();
    homeViewModel.fetchFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Consumer<HomeViewModel>(builder: (context, value, _) {
              switch (value.productsList.status) {
                case Status.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return Text(value.productsList.toString());
                case Status.COMPLETED:
                  return Column(children: [
                    SizedBox(
                      height: height * .02,
                    ),
                    _popularProductList(height, value),
                  ]);
                default:
                  return const Text("Hata");
              }
            })),
      ],
    );
  }

  Widget _popularProductList(double height, HomeViewModel value) {
    return SizedBox(
        height: height * .32,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: value.productsList.data!.results.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: DB.instance.checkFavoriteExist(
                        value.productsList.data!.results[index].id),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        case ConnectionState.done:
                          {
                            return ProductsItem(
                                isFavorite:
                                    snapshot.data!.isEmpty ? false : true,
                                products:
                                    value.productsList.data!.results[index]);
                          }
                      }
                    });
                // }
              }),
        ));
  }
}

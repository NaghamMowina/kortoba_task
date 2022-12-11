import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/model/products_model.dart';
import 'package:kortoba_assign/service/db.dart';
import 'package:kortoba_assign/view/home/categories/category_item.dart';
import 'package:kortoba_assign/view/home/products/product_item.dart';
import 'package:kortoba_assign/view_model/category_products_view_model.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';

class ProductsListView extends StatefulWidget {
  final int id;
  const ProductsListView({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductsListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<ProductsListView> {
  CategoryProductViewModel categoryProductViewModel =
      CategoryProductViewModel();

  @override
  void initState() {
    categoryProductViewModel.fetchProductsApi(widget.id);
    categoryProductViewModel.fetchFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChangeNotifierProvider<CategoryProductViewModel>(
            create: (BuildContext context) => categoryProductViewModel,
            child: Consumer<CategoryProductViewModel>(
                builder: (context, value, _) {
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

  Widget _popularProductList(double height, CategoryProductViewModel value) {
    return SizedBox(
        height: height,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.74),
              // scrollDirection: Axis.horizontal,
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

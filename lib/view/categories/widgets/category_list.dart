import 'package:flutter/material.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchCategoriesApi();
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
              switch (value.categoriesList.status) {
                case Status.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return Text(value.categoriesList.toString());
                case Status.COMPLETED:
                  return Column(children: [
                    _popularCategoryList(height, value),
                  ]);
                default:
                  return const Text("Hata");
              }
            })),
      ],
    );
  }

  Widget _popularCategoryList(double height, HomeViewModel value) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: value.categoriesList.data!.results.length,
          itemBuilder: (context, index) {
            return CategoryItem(
                categories: value.categoriesList.data!.results[index]);
          }),
    );
  }
}

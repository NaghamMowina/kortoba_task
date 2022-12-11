import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/view/categoryProducts/products_screen.dart';

import '../../../model/categories_model.dart';

class CategoryItem extends StatelessWidget {
  final Results categories;
  const CategoryItem({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
        // designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CategoriesProductsScreen(
                          id: categories.id,
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(categories.imageLink),
                    radius: height * .04,
                  ),
                  TextUtils(
                    text: categories.name,
                    align: TextAlign.center,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                  ),
                ],
              ),
            ),
          );
        });
  }
}

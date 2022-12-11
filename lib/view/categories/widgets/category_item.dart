import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/text_widget.dart';

import '../../../model/categories_model.dart';
import '../../categoryProducts/products_screen.dart';

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
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CategoriesProductsScreen(
                        id: categories.id,
                      ))),
              child: Container(
                width: width,
                height: height * .2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.modulate),
                        image: NetworkImage(categories.imageLink, scale: .6))),
                child: Center(
                  child: TextUtils(
                    text: categories.name,
                    color: Colors.white,
                    fontSize: 35.sp,
                    align: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ),
          );
        });
  }
}

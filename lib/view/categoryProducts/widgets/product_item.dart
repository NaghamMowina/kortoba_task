import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/service/db.dart';

import '../../../model/products_model.dart';
import '../../../view_model/home_view_model.dart';

class ProductsItem extends StatefulWidget {
  final bool isFavorite;
  final Results products;
  const ProductsItem({
    Key? key,
    required this.products,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  bool favorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    HomeViewModel homeViewModel = HomeViewModel();

    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.products.imageLink,
                      width: width * .35,
                      height: height * .15,
                    ),
                    Positioned(
                      right: -10,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              favorite != favorite;
                              print('favoritee is $favorite');
                            });
                            favorite
                                ? homeViewModel
                                    .removeFavorite(widget.products.id)
                                : homeViewModel.addToFavorites(widget.products);
                          },
                          icon: Icon(
                            favorite ? Icons.favorite : Icons.favorite_outline,
                            size: 25.h,
                            color: AppConstants.orange,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 100.w,
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(
                      fontSize: 12.sp,
                    ),
                    text: TextSpan(
                        style: TextStyle(
                            color: AppConstants.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal'),
                        text: widget.products.name),
                  ),
                ),
                // TextUtils(
                //   text: products.name,
                //   color: AppConstants.grey,
                //   fontSize: 18.sp,
                //   align: TextAlign.center,
                //   fontWeight: FontWeight.w500,
                //   fontFamily: 'Tajawal',
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: widget.products.price + 'ج.م',
                      color: AppConstants.blue,
                      align: TextAlign.center,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tajawal',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/add-cart.png',
                          color: AppConstants.grey,
                          width: width * .06,
                          height: height * .05,
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

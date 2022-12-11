import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/service/db.dart';
import 'package:kortoba_assign/view_model/wishlist_view_model.dart';

import '../../../model/products_model.dart';
import '../../../view_model/home_view_model.dart';

class WishlistItem extends StatefulWidget {
  final FavoritesModel products;
  const WishlistItem({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<WishlistItem> createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  bool favorite = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    WishlistViewModel wishlistViewModel = WishlistViewModel();

    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Stack(
                    children: [
                      Image.network(
                        widget.products.imageLink,
                        width: width,
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
                                  ? wishlistViewModel
                                      .removeFavorite(widget.products.id)
                                  : wishlistViewModel
                                      .addToFavorites(widget.products);
                            },
                            icon: Icon(
                              favorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 25.h,
                              color: AppConstants.orange,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                // SizedBox(
                //   width: 100.w,
                //   child: RichText(
                //     maxLines: 2,
                //     overflow: TextOverflow.ellipsis,
                //     strutStyle: StrutStyle(
                //       fontSize: 12.sp,
                //     ),
                //     text: TextSpan(
                //         style: TextStyle(
                //             color: AppConstants.grey,
                //             fontSize: 18.sp,
                //             fontWeight: FontWeight.w500,
                //             fontFamily: 'Tajawal'),
                //         text: widget.products.name),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextUtils(
                    text: widget.products.name,
                    color: AppConstants.grey,
                    fontSize: 18.sp,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: TextUtils(
                    text: widget.products.price + 'ج.م',
                    color: AppConstants.blue,
                    align: TextAlign.center,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: AppConstants.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  width: width,
                  child: Center(
                    child: TextUtils(
                      text: 'نقل إلى سلة التسوق',
                      fontSize: 15.sp,
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

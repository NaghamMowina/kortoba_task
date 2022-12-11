import 'package:blur/blur.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/view/auth/widgets/label_widget.dart';
import 'package:kortoba_assign/view/home/categories/category_list.dart';
import 'package:kortoba_assign/view/home/products/products_list.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: <Widget>[
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: AppConstants.orange,
            //   ),
            //   child: Center(
            //     child: Text(
            //       name!,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: AppConstants.snow),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.46,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: const Icon(Icons.logout, color: AppConstants.orange),
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: AppConstants.orange),
                  onTap: () {
                    viewModel.logout(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: ScreenUtilInit(
          // designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return ListView(
              // padding: EdgeInsets.all(10.w),
              children: [
                Image.asset('assets/images/cmen.png').blurred(
                  colorOpacity: 0.2,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10)),
                  blur: 30,
                  overlay: ListView(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: TextUtils(
                              text: 'الرئيسية',
                              fontSize: 20.sp,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () =>
                                scaffoldKey.currentState!.openDrawer(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 30.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black54),
                            onFieldSubmitted: (value) {
                              // setState(() {
                              //   search = value;
                              // });
                            },
                            onChanged: (value) {
                              // setState(() {
                              //   search = value;
                              // });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintTextDirection: TextDirection.rtl,
                                hintText: "عم تبحث ؟",
                                hintStyle: TextStyle(fontSize: 15.sp),
                                suffixIcon: const Icon(Icons.search,
                                    color: Colors.black54)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                  width: 90.w,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        viewModel.discounts[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: viewModel.discounts.length,
                    viewportFraction: 0.8,
                    scale: 0.6,
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: AppConstants.grey)),
                    outer: true,
                  ),
                ),
                CategoriesListView(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: 'عرض الكل',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                      ),
                      TextUtils(
                        text: 'وصل حديثا',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                      ),
                    ],
                  ),
                ),
                ProductsListView()
              ],
            );
          }),
    );
  }
}

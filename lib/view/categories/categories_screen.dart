import 'package:blur/blur.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/view/categories/widgets/category_list.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';

import '../../res/app_constants.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
        key: scaffoldKey,
        // extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextUtils(
            text: 'التصنيفات',
            fontFamily: 'Tajawal',
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          centerTitle: true,
        ),
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
                    leading:
                        const Icon(Icons.logout, color: AppConstants.orange),
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
        body: ListView(
          padding: EdgeInsets.all(10.w),
          children: [CategoriesList()],
        ));
  }
}

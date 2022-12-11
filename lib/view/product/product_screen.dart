import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/model/products_model.dart';
import 'package:kortoba_assign/res/text_widget.dart';

class ProductScreen extends StatelessWidget {
  final Results productsModel;
  const ProductScreen({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScreenUtilInit(
          // designSize: const Size(360, 690),
          // minTextAdapt: true,
          // splitScreenMode: true,
          builder: (context, child) {
            return ListView(children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                        width: 300.w,
                        height: 200.h,
                        child: Image.network(
                          productsModel.imageLink,
                          fit: BoxFit.contain,
                        )),
                    Row(
                      children: [TextUtils(text: 'text')],
                    )
                  ],
                ),
              ),
            ]);
          },
        ));
  }
}

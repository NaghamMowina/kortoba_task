import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/view/auth/screens/register/register_screen.dart';
import 'package:kortoba_assign/view_model/auth_view_model.dart';

import '../../../../res/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel authViewModel = AuthViewModel();
  bool _passwordVisible = false;
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  // LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xFFF5F5F9),
      body: ScreenUtilInit(
          // designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 40.w),

                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextUtils(
                    text: 'تسجيل الدخول',
                    fontFamily: 'Tajawal',
                    align: TextAlign.center,
                    color: AppConstants.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  TextUtils(
                    text: 'من فضلك قم بالدخول لإتمام الشراء',
                    fontFamily: 'Tajawal',
                    fontSize: 15.sp,
                    align: TextAlign.center,
                    color: AppConstants.grey,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextUtils(
                      text: 'اسم المستخدم',
                      fontFamily: 'Tajawal',
                      fontSize: 15.sp,
                      color: AppConstants.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid username' : null,

                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppConstants.blue,
                    ),
                    //This will obscure text dynamically
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.h),
                      //                               labelText: 'User Name',
                      //  labelStyle: const TextStyle(
                      //                                 decorationColor: Colors.black,
                      //                                 // fontSize: 16,
                      //                                 fontFamily: 'Tajawal',
                      //                                 color: Colors.grey,
                      //                                 fontWeight: FontWeight.bold,
                      //                               ),
                      // hintText: 'Enter your email or phone',
                      // Here is key idea
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextUtils(
                      text: 'كلمة السر',
                      fontFamily: 'Tajawal',
                      fontSize: 15.sp,
                      color: AppConstants.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordcontroller,
                    obscureText: !_passwordVisible,

                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid password' : null,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppConstants.blue,
                    ),
                    //This will obscure text dynamically
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppConstants.grey, size: 20.h,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.all(8.h),

                      // hintText: 'Enter your email or phone',
                      // Here is key idea
                      fillColor: Colors.white,
                      filled: true,
                      //  labelText: 'Password',   labelStyle: const TextStyle(
                      //     decorationColor: Colors.black,
                      //     // fontSize: 16,
                      //     fontFamily: 'Tajawal',
                      //     color: Colors.grey,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppConstants.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppConstants.orange),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                      width: size.width * .6,
                      height: 35.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(2.h),
                            backgroundColor: AppConstants.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              authViewModel.loginApi(
                                  context,
                                  _emailcontroller.text,
                                  _passwordcontroller.text);
                              // login();
                            }
                            // loginViewModel
                            //     .loginApi(_emailcontroller.text,
                            //         _passwordcontroller.text)
                            //     .then((value) {
                            //   value == true
                            //       ?
                            // Navigator.of(context).push(
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   HomeScreen()))
                            //       : null;
                            // });
                          },
                          child: TextUtils(
                            text: 'الدخول',
                            color: Colors.white,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ))),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            print('preesssssss');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                          },
                          child: TextUtils(
                            text: 'التسجيل',
                            fontFamily: 'Tajawal',
                            fontSize: 20.sp,
                            align: TextAlign.center,
                            color: AppConstants.orange,
                            fontWeight: FontWeight.bold,
                          )),
                      TextUtils(
                        text: 'ليس لديك حساب ؟',
                        fontFamily: 'Tajawal',
                        fontSize: 15.sp,
                        align: TextAlign.center,
                        color: AppConstants.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

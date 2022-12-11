import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/view/auth/widgets/label_widget.dart';
import '../../../../../res/text_widget.dart';
import '../../../../view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
  AuthViewModel authViewModel = AuthViewModel();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  // LoginViewModel loginViewModel = LoginViewModel();
  final _formkey = GlobalKey<FormState>();

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
                    text: 'حساب جديد',
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
                    text: 'مرحبا بك ، قم بملأ البيانات للتسجيل',
                    fontFamily: 'Tajawal',
                    fontSize: 15.sp,
                    align: TextAlign.center,
                    color: AppConstants.grey,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  LabelWidget(text: 'اسم المستخدم'),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    controller: _usernamecontroller,
                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid username' : null,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 35, 35, 44),
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
                  LabelWidget(text: 'البريد الالكتروني'),
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
                      color: Color.fromARGB(255, 35, 35, 44),
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
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LabelWidget(text: 'الاسم الأول'),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    controller: _firstNamecontroller,
                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid username' : null,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 35, 35, 44),
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
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LabelWidget(text: 'الاسم الأخير'),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.emailAddress,
                    controller: _lastNamecontroller,
                    validator: (value) =>
                        value!.isEmpty ? 'enter a valid username' : null,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 35, 35, 44),
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
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LabelWidget(text: 'كلمة السر'),
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
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LabelWidget(text: 'تأكيد كلمة السر'),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _confirmpasswordcontroller,
                    obscureText: !_passwordVisible,

                    validator: (value) => value!.isEmpty
                        ? 'enter a valid password'
                        : value != _passwordcontroller.text
                            ? 'not matching password'
                            : null,
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
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
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

                              authViewModel.registerApi(
                                  context,
                                  _emailcontroller.text,
                                  _passwordcontroller.text,
                                  _usernamecontroller.text,
                                  _firstNamecontroller.text,
                                  _lastNamecontroller.text);
                              // login();
                            }
                          },
                          child: TextUtils(
                            text: 'التسجيل',
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
                            Navigator.pop(context);
                          },
                          child: TextUtils(
                            text: 'الدخول',
                            fontFamily: 'Tajawal',
                            fontSize: 20.sp,
                            align: TextAlign.center,
                            color: AppConstants.orange,
                            fontWeight: FontWeight.bold,
                          )),
                      TextUtils(
                        text: 'لديك حساب ؟',
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

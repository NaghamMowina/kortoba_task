import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kortoba_assign/view/auth/screens/login/login_screen.dart';
import 'package:kortoba_assign/view/home/bottom_navigator.dart';
import 'package:kortoba_assign/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () => checkLoggedIn());
  }

  // @override
  // void didChangeDependencies() {
  //   precacheImage(AssetImage('images/logo.png'), context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.contain,
        //         // colorFilter: ColorFilter.mode(
        //         //   Colors.grey.withOpacity(0.4),
        //         //   BlendMode.modulate,
        //         // ),
        //         image: AssetImage(
        //             'assets/images/splash.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/logo.jpg'),
            // SizedBox(
            //   height: 20,
            // ),
            // const Center(
            //   child: TextUtils(
            //     text: 'Welcome',
            //     fontSize: 50,
            //     color: AppConstants.cornflowerBlue3,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var logged = prefs.getBool('logged') ?? false;

    if (logged) {
      // await AuthApi.newToken('person', context);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeNavigator()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen()));
    }

    print(logged);
  }
}

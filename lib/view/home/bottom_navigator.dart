import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';
import 'package:kortoba_assign/view/wishlist/wishlist_screen.dart';
import '../../utils/themes/color_schemes.g.dart';
import '../../utils/themes/palette.dart';
import '../categories/categories_screen.dart';
import 'home_screen.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeState();
}

class _HomeState extends State<HomeNavigator> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> _pages = [
    HomeScreen(),
    CategoriesScreen(),
    WishlistScreen(),
    HomeScreen(),
    // Booking(),
    // Profile(),
    // Service(),
    // Products(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kortoba Shop',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemes.darkColorScheme,
        textTheme: TextThemes.darkTextTheme,
        primarySwatch: Palette.kBlue,
      ),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Manrope-bold',
        scaffoldBackgroundColor: Color(0xFFF5F5F9),
        textTheme: TextThemes.lightTextTheme,
        colorScheme: ColorSchemes.lightColorScheme,
        primarySwatch: Palette.kBlue,
        iconTheme: IconThemes.lightIconTheme,
        appBarTheme: AppBarThemes.lightAppBarTheme,
        buttonTheme: ButtonThemes.lightButtonTheme,
      ),
      home: ScreenUtilInit(
          // designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Scaffold(
              extendBody: true,
              bottomNavigationBar: SizedBox(
                height: 50.h,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,

                  ///This allow more than 3 items
                  backgroundColor: Colors.white,
                  currentIndex: _currentIndex,
                  unselectedFontSize: 12.sp,
                  selectedFontSize: 12.sp,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 18.h,
                      ),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.category,
                        size: 18.h,
                      ),
                      label: 'الأقسام',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 18.h,
                      ),
                      label: 'المفضلة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 18.h,
                      ),
                      label: 'الحساب',
                    ),
                  ],
                  onTap: (index) {
                    //Handle button tap
                    setState(() {
                      _currentIndex = index;
                    });
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => _pages[index]));
                  },
                ),
              ),
              body: Center(
                child: _pages.elementAt(_currentIndex),
              ),
            );
          }),
    );
  }
}

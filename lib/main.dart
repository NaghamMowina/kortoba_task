import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kortoba_assign/splash_screen.dart';
import 'package:kortoba_assign/utils/themes/color_schemes.g.dart';
import 'package:kortoba_assign/utils/themes/palette.dart';
import 'package:kortoba_assign/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', 'SA'),
            // OR Locale('ar', 'AE') OR Other RTL locales
          ],
          title: 'kortoba shop',
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
          home: SplashScreen(),
        ));
  }
}

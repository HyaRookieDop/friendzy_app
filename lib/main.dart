import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/config/application.dart';
import 'package:friendzy_app/config/router.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppComponent());
}

class AppComponent extends StatefulWidget {
  const AppComponent({super.key});

  @override
  State<StatefulWidget> createState() => AppComponentState();
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: "Hellix",
                textTheme: TextTheme(
                    headlineLarge: TextStyle(
                        color: Colours.kPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                    titleLarge: TextStyle(
                        color: Colours.kPrimary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                    titleSmall: TextStyle(
                        color: Colours.kPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    bodyMedium: TextStyle(
                        color: Colours.kPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                    bodySmall: TextStyle(
                        color: Colours.kBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal))),
            onGenerateRoute: Application.router.generator,
          );
        });
  }
}

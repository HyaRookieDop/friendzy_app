import 'package:friendzy_app/screens/notFound/not_found.dart';
import 'package:friendzy_app/screens/onBoarding/on_boarding_screen.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String rootRoute = "/";

  static void configureRoutes(FluroRouter router) {
    // 无法匹配路由时的处理
    router.notFoundHandler =
        Handler(handlerFunc: (context, parameters) => NotFound());
    router.define(rootRoute,
        handler: Handler(
            handlerFunc: (context, paramters) => const OnBoardingScreen()));
  }
}

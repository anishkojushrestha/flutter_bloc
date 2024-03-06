part of 'router_imports.dart';

class GenRouter {
  static Route<dynamic> AppRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/card':
        return MaterialPageRoute(builder: (context) => Cards());
      case '/wish':
        return MaterialPageRoute(builder: (context) => WishList());

      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}

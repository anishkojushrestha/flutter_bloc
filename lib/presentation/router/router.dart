part of 'router_imports.dart';

class GenRouter {
  static Route<dynamic> AppRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/card':
        return MaterialPageRoute(builder: (context) => Card());

      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}

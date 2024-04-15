import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName,predicate, arguments: arguments);
  }

  void pop(BuildContext context) => Navigator.of(context).pop();
}

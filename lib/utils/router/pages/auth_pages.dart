import 'package:go_router/go_router.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';

final List<RouteBase> authPages = [
  GoRoute(
    path: AuthScreen.routeName,
    builder: (context, state) => const AuthScreen(),
  ),
  GoRoute(
    path: ForgotPasswordScreen.routeName,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
];

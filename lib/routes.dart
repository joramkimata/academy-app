import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/routes/routes.dart';

final routes = {
  Routes.homeUrl: (_) => SplashPage(),
  Routes.loginUrl: (_) => LoginPage(),
  Routes.resetPasswordUrl: (_) => ForgetPasswordPage(),
  Routes.registerUrl: (_) => RegisterPage(),
};

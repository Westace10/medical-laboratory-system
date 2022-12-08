import 'package:lab_management_app/app/app.locator.dart';
import 'package:lab_management_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _nagivationService = locator<NavigationService>();

  void goToSignUp() {
    _nagivationService.navigateTo(Routes.signUpView);
  }
}

import 'package:flutter/material.dart';
import 'package:lab_management_app/app/app.locator.dart';
import 'package:lab_management_app/app/app.logger.dart';
import 'package:lab_management_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final log = getLogger("SignUpViewModel");
  final _nagivationService = locator<NavigationService>();

  void drawerControl(GlobalKey<ScaffoldState> key) {
    key.currentState!.openDrawer();
  }

  void processLogout() async {
    log.i('Logging out .....');
    setBusy(true);
    await Future.delayed(const Duration(seconds: 5));
    goToLogin();
    setBusy(false);
  }

  void goToLogin() {
    _nagivationService.clearStackAndShow(Routes.loginView);
  }
}

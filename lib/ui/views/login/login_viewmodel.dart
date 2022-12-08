import 'package:dio/dio.dart';
import 'package:lab_management_app/app/app.locator.dart';
import 'package:lab_management_app/app/app.logger.dart';
import 'package:lab_management_app/app/app.router.dart';
import 'package:lab_management_app/core/services/api_services.dart';
import 'package:lab_management_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger("ServerListViewModel");
  final _nagivationService = locator<NavigationService>();
  final _getServerService = ApiService();

  String _passwordValidationMessage = "";
  String get errorMessage => _passwordValidationMessage;

  void passwordValidationMessage() {
    _passwordValidationMessage = "Error in the form, please try again";
    notifyListeners();
  }

  void processSignIn() async {
    log.i('Processing authentication .....');
    setBusy(true);
    Response response = await _getServerService.login(body: {
      "email": emailValue,
      "password": passwordValue,
    });
    print(response);
    goToDashboard();
    setBusy(false);
  }

  void processSignInWithGoogle() {
    log.i('Processing google authentication .....');
  }

  void goToSignUp() {
    _nagivationService.clearStackAndShow(Routes.signUpView);
  }

  void goToDashboard() {
    _nagivationService.clearStackAndShow(Routes.dashboardView);
  }

  @override
  void setFormStatus() {
    log.i('Set form Status with data: $formValueMap');

    // Set the validation message per field
    setPasswordValidationMessage(passwordValidator(value: passwordValue));

    // Set a validation message for the entire form
    // if (hasPasswordValidationMessage) {
    //   setFormValidationMessage('Error in the form, please check again');
    // }
  }

  String? passwordValidator({String? value, int minimumLength = 6}) {
    if (value != null && value.length < minimumLength) {
      return "Password should have min $minimumLength characters";
    } else {
      return null;
    }
  }
}

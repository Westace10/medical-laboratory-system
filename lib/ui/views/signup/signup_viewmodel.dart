import 'package:dio/dio.dart';
import 'package:lab_management_app/app/app.locator.dart';
import 'package:lab_management_app/app/app.logger.dart';
import 'package:lab_management_app/app/app.router.dart';
import 'package:lab_management_app/core/services/api_services.dart';
import 'package:lab_management_app/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  final log = getLogger("SignUpViewModel");
  final _nagivationService = locator<NavigationService>();
  final _getServerService = ApiService();

  String _passwordValidationMessage = "";
  String get errorMessage => _passwordValidationMessage;

  void passwordValidationMessage() {
    _passwordValidationMessage = "Error in the form, please try again";
    notifyListeners();
  }

  void processSignUp() async {
    log.i('Processing signup .....');
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    Response response = await _getServerService.signUp(
      body: {
        "username": "akeem ashaolu",
        "email": emailValue,
        "password": passwordValue,
        "role": "admin"
      },
    );
    print(response);
    // print(emailValue);
    // print(passwordValue);
    goToDashboard();
    setBusy(false);
  }

  void processSignUpWithGoogle() {
    log.i('Processing google signup .....');
  }

  void goToLogin() {
    _nagivationService.clearStackAndShow(Routes.loginView);
  }

  void goToDashboard() {
    _nagivationService.navigateTo(Routes.dashboardView);
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

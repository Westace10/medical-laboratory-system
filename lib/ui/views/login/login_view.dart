import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/shared/border_radius.dart';
import 'package:lab_management_app/ui/shared/color.dart';
import 'package:lab_management_app/ui/shared/spacing.dart';
import 'package:lab_management_app/ui/views/login/login_view.form.dart';
import 'package:lab_management_app/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
  ),
  FormTextField(
    name: 'password',
  )
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveWidget(
          largeScreen: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  color: Colors.pink.shade100,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.contain,
                            height: 100,
                            // width: 10,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Column(
                              children: [
                                verticalSpaceSmall,
                                Row(
                                  children: const [
                                    Text(
                                      "Email address",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: emailController,
                                  focusNode: emailFocusNode,
                                  decoration: InputDecoration(
                                    fillColor: kWhiteColor,
                                    hintText: "Enter email address",
                                    hintStyle: TextStyle(
                                      color: AppColor.neutralColor.shade200,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 14.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.neutralColor.shade200,
                                          width: 1.0),
                                      borderRadius: normalBorderRadius,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppColor.neutralColor.shade500,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColor.kErrorColor,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppColor.neutralColor.shade200,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                  ),
                                ),
                                if (model.hasEmailValidationMessage)
                                  Text(
                                    model.emailValidationMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                verticalSpaceMini,
                                Row(
                                  children: const [
                                    Text(
                                      "Password",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: passwordController,
                                  focusNode: passwordFocusNode,
                                  decoration: InputDecoration(
                                    fillColor: kWhiteColor,
                                    hintText: "Enter password",
                                    hintStyle: TextStyle(
                                      color: AppColor.neutralColor.shade200,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 14.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.neutralColor.shade200,
                                          width: 1.0),
                                      borderRadius: normalBorderRadius,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppColor.neutralColor.shade500,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColor.kErrorColor,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppColor.neutralColor.shade200,
                                            width: 1.0),
                                        borderRadius: normalBorderRadius),
                                  ),
                                ),
                                if (model.hasPasswordValidationMessage)
                                  Text(
                                    model.errorMessage,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                verticalSpaceMini,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: model.processSignIn,
                                    child: model.isBusy
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text("Login"),
                                  ),
                                ),
                                verticalSpaceMini,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.red, Colors.blue],
                                            begin: FractionalOffset(0.0, 0.0),
                                            end: FractionalOffset(0.5, 0.0),
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                      ),
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    const Text("Or"),
                                    Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.blue, Colors.red],
                                            begin: FractionalOffset(0.0, 0.0),
                                            end: FractionalOffset(0.8, 0.0),
                                            stops: [0.0, 0.8],
                                            tileMode: TileMode.clamp),
                                      ),
                                      height: 2,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ],
                                ),
                                verticalSpaceMini,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey.shade100,
                                      foregroundColor: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/google_icon.svg',
                                          height: 30,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text("Sign in with Google"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: model.goToSignUp,
                                child: const Text("Create account")),
                          ],
                        ),
                        verticalSpaceMini,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          smallScreen: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                        height: 100,
                        // width: 10,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Column(
                          children: [
                            verticalSpaceSmall,
                            Row(
                              children: const [
                                Text(
                                  "Email address",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: emailController,
                              focusNode: emailFocusNode,
                              decoration: InputDecoration(
                                fillColor: kWhiteColor,
                                hintText: "Enter email address",
                                hintStyle: TextStyle(
                                  color: AppColor.neutralColor.shade200,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 14.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.neutralColor.shade200,
                                      width: 1.0),
                                  borderRadius: normalBorderRadius,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.neutralColor.shade500,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColor.kErrorColor,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.neutralColor.shade200,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                              ),
                            ),
                            if (model.hasEmailValidationMessage)
                              Text(
                                model.emailValidationMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            verticalSpaceMini,
                            Row(
                              children: const [
                                Text(
                                  "Password",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              decoration: InputDecoration(
                                fillColor: kWhiteColor,
                                hintText: "Enter password",
                                hintStyle: TextStyle(
                                  color: AppColor.neutralColor.shade200,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 14.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.neutralColor.shade200,
                                      width: 1.0),
                                  borderRadius: normalBorderRadius,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.neutralColor.shade500,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColor.kErrorColor,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.neutralColor.shade200,
                                        width: 1.0),
                                    borderRadius: normalBorderRadius),
                              ),
                            ),
                            if (model.hasPasswordValidationMessage)
                              Text(
                                model.errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            verticalSpaceMini,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: model.processSignIn,
                                child: const Text("Login"),
                              ),
                            ),
                            verticalSpaceMini,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.red, Colors.blue],
                                        begin: FractionalOffset(0.0, 0.0),
                                        end: FractionalOffset(0.5, 0.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  height: 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                                const Text("Or"),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.red],
                                        begin: FractionalOffset(0.0, 0.0),
                                        end: FractionalOffset(0.8, 0.0),
                                        stops: [0.0, 0.8],
                                        tileMode: TileMode.clamp),
                                  ),
                                  height: 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                              ],
                            ),
                            verticalSpaceMini,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  foregroundColor: Colors.grey,
                                ),
                                onPressed: model.processSignInWithGoogle,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/google_icon.svg',
                                      height: 30,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text("Sign in with Google"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: model.goToSignUp,
                            child: const Text("Create account")),
                      ],
                    ),
                    verticalSpaceMini,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

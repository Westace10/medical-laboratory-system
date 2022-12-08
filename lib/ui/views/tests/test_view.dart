import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/views/tests/test_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TestViewModel>.reactive(
      // onModelReady: (model) => model.initialised,
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Test large page",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 65,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        smallScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Test small page",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 65,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        mediumScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Test medium page",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 65,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => TestViewModel(),
    );
  }
}

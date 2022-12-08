import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/views/support/support_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SupportView extends StatelessWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
      // onModelReady: (model) => model.initialised,
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Support large page",
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
                "Support small page",
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
                "Support medium page",
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
      viewModelBuilder: () => SupportViewModel(),
    );
  }
}

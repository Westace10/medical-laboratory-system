import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      // onModelReady: (model) => model.initialised,
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Profile large page",
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
                "Profile small page",
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
                "Profile medium page",
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
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

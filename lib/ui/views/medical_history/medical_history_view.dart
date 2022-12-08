import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/views/medical_history/medical_history_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MedicalHistoryView extends StatelessWidget {
  const MedicalHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MedicalHistoryViewModel>.reactive(
      // onModelReady: (model) => model.initialised,
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Medical history large page",
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
                "Medical history small page",
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
                "Medical history medium page",
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
      viewModelBuilder: () => MedicalHistoryViewModel(),
    );
  }
}

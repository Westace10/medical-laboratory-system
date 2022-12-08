import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/shared/spacing.dart';
import 'package:lab_management_app/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      // onModelReady: (model) => model.initialised,
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          backgroundColor: Colors.green.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListView(
                          children: [
                            Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          children: const [
                                            Text("Health status"),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpaceSmall,
                            Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          children: const [
                                            Text("Health status"),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpaceSmall,
                            Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          children: const [
                                            Text("Health status"),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpaceSmall,
                            Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          children: const [
                                            Text("Health status"),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: const [
                                      Text("Health status"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        smallScreen: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Text(
                "Home small page",
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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.005,
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width * 0.52,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: const [
                                      Text("Health status"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.005,
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: const [
                                          Text("Health status"),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          verticalSpaceSmall,
                          Container(
                            color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: const [
                                          Text("Health status"),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

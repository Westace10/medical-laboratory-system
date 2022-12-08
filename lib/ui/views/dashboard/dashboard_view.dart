import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:lab_management_app/core/utils/responsiveness.dart';
import 'package:lab_management_app/ui/views/appointment/appointment_view.dart';
import 'package:lab_management_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:lab_management_app/ui/views/home/home_view.dart';
import 'package:lab_management_app/ui/views/medical_history/medical_history_view.dart';
import 'package:lab_management_app/ui/views/profile/profile_view.dart';
import 'package:lab_management_app/ui/views/support/support_view.dart';
import 'package:lab_management_app/ui/views/tests/test_view.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                collapseWidth: 15000,
                alwaysShowFooter: true,
                controller: pageController,
                style: SideMenuStyle(
                  // showTooltip: false,
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: Colors.pink.shade50,
                  selectedColor: Colors.pink.shade100,
                  unselectedIconColor: Colors.pink.shade100,
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  unselectedTitleTextStyle:
                      const TextStyle(color: Colors.black),
                  selectedIconColor: Colors.white,
                  backgroundColor: Colors.white,
                ),
                title: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 150,
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    const Divider(
                      indent: 8.0,
                      endIndent: 8.0,
                    ),
                  ],
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SideMenuItem(
                    priority: 6,
                    title: 'Logout',
                    icon: const Icon(Icons.exit_to_app),
                    trailing: model.isBusy
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.pink.shade100,
                                strokeWidth: 2.0,
                              ),
                            ),
                          )
                        : Container(),
                    onTap: model.processLogout,
                  ),
                ),
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Dashboard',
                    onTap: () {
                      pageController.jumpToPage(0);
                    },
                    icon: const Icon(Icons.home),
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                    tooltipContent: "This is a tooltip for Dashboard item",
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Appointments',
                    onTap: () {
                      pageController.jumpToPage(1);
                    },
                    icon: const Icon(Icons.supervisor_account),
                  ),
                  SideMenuItem(
                    priority: 2,
                    title: 'Test',
                    onTap: () {
                      pageController.jumpToPage(2);
                    },
                    icon: const Icon(Icons.file_copy_rounded),
                    trailing: Container(
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 3),
                          child: Text(
                            'New',
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[800]),
                          ),
                        )),
                  ),
                  SideMenuItem(
                    priority: 3,
                    title: 'Profile',
                    onTap: () {
                      pageController.jumpToPage(3);
                    },
                    icon: const Icon(Icons.person),
                  ),
                  SideMenuItem(
                    priority: 4,
                    title: 'Medical history',
                    onTap: () {
                      pageController.jumpToPage(4);
                    },
                    icon: const Icon(Icons.history),
                  ),
                  SideMenuItem(
                    priority: 5,
                    title: 'Support',
                    onTap: () {
                      pageController.jumpToPage(5);
                    },
                    icon: const Icon(Icons.help),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    HomeView(),
                    AppointmentView(),
                    TestView(),
                    ProfileView(),
                    MedicalHistoryView(),
                    SupportView()
                  ],
                ),
              )
            ],
          ),
        ),
        // mediumScreen: Scaffold(
        //   body: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       SideMenu(
        //         controller: pageController,
        //         style: SideMenuStyle(
        //           // showTooltip: false,
        //           displayMode: SideMenuDisplayMode.auto,
        //           hoverColor: Colors.pink.shade50,
        //           selectedColor: Colors.pink.shade100,
        //           unselectedIconColor: Colors.pink.shade100,
        //           selectedTitleTextStyle: const TextStyle(color: Colors.white),
        //           unselectedTitleTextStyle:
        //               const TextStyle(color: Colors.black),
        //           selectedIconColor: Colors.white,
        //           backgroundColor: Colors.white,
        //         ),
        //         title: Column(
        //           children: [
        //             ConstrainedBox(
        //               constraints: const BoxConstraints(
        //                 maxHeight: 150,
        //                 maxWidth: 150,
        //               ),
        //               child: Image.asset(
        //                 'assets/images/logo.png',
        //               ),
        //             ),
        //             const Divider(
        //               indent: 8.0,
        //               endIndent: 8.0,
        //             ),
        //           ],
        //         ),
        //         footer: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: SideMenuItem(
        //             priority: 6,
        //             title: 'Logout',
        //             icon: const Icon(Icons.exit_to_app),
        //             trailing: model.isBusy
        //                 ? SizedBox(
        //                     height: 20,
        //                     width: 20,
        //                     child: Center(
        //                       child: CircularProgressIndicator(
        //                         color: Colors.pink.shade100,
        //                         strokeWidth: 2.0,
        //                       ),
        //                     ),
        //                   )
        //                 : Container(),
        //             onTap: model.processLogout,
        //           ),
        //         ),
        //         items: [
        //           SideMenuItem(
        //             priority: 0,
        //             title: 'Dashboard',
        //             onTap: () {
        //               pageController.jumpToPage(0);
        //             },
        //             icon: const Icon(Icons.home),
        //             badgeContent: const Text(
        //               '3',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             tooltipContent: "This is a tooltip for Dashboard item",
        //           ),
        //           SideMenuItem(
        //             priority: 1,
        //             title: 'Appointments',
        //             onTap: () {
        //               pageController.jumpToPage(1);
        //             },
        //             icon: const Icon(Icons.supervisor_account),
        //           ),
        //           SideMenuItem(
        //             priority: 2,
        //             title: 'Test',
        //             onTap: () {
        //               pageController.jumpToPage(2);
        //             },
        //             icon: const Icon(Icons.file_copy_rounded),
        //             trailing: Container(
        //                 decoration: const BoxDecoration(
        //                     color: Colors.amber,
        //                     borderRadius: BorderRadius.all(Radius.circular(6))),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                       horizontal: 6.0, vertical: 3),
        //                   child: Text(
        //                     'New',
        //                     style: TextStyle(
        //                         fontSize: 11, color: Colors.grey[800]),
        //                   ),
        //                 )),
        //           ),
        //           SideMenuItem(
        //             priority: 3,
        //             title: 'Profile',
        //             onTap: () {
        //               pageController.jumpToPage(3);
        //             },
        //             icon: const Icon(Icons.person),
        //           ),
        //           SideMenuItem(
        //             priority: 4,
        //             title: 'Medical history',
        //             onTap: () {
        //               pageController.jumpToPage(4);
        //             },
        //             icon: const Icon(Icons.history),
        //           ),
        //           SideMenuItem(
        //             priority: 5,
        //             title: 'Support',
        //             onTap: () {
        //               pageController.jumpToPage(5);
        //             },
        //             icon: const Icon(Icons.help),
        //           ),
        //         ],
        //       ),
        //       Expanded(
        //         child: PageView(
        //           controller: pageController,
        //           children: const [
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Dashboard large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Appointment large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Test large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Profile large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Medical history large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Support large view"),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // smallScreen: Scaffold(
        //   body: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       SideMenu(
        //         controller: pageController,
        //         style: SideMenuStyle(
        //           // showTooltip: false,
        //           displayMode: SideMenuDisplayMode.auto,
        //           hoverColor: Colors.pink.shade50,
        //           selectedColor: Colors.pink.shade100,
        //           unselectedIconColor: Colors.pink.shade100,
        //           selectedTitleTextStyle: const TextStyle(color: Colors.white),
        //           unselectedTitleTextStyle:
        //               const TextStyle(color: Colors.black),
        //           selectedIconColor: Colors.white,
        //           backgroundColor: Colors.white,
        //         ),
        //         title: Column(
        //           children: [
        //             ConstrainedBox(
        //               constraints: const BoxConstraints(
        //                 maxHeight: 150,
        //                 maxWidth: 150,
        //               ),
        //               child: Image.asset(
        //                 'assets/images/logo.png',
        //               ),
        //             ),
        //             const Divider(
        //               indent: 8.0,
        //               endIndent: 8.0,
        //             ),
        //           ],
        //         ),
        //         footer: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: SideMenuItem(
        //             priority: 6,
        //             title: 'Logout',
        //             icon: const Icon(Icons.exit_to_app),
        //             trailing: model.isBusy
        //                 ? SizedBox(
        //                     height: 20,
        //                     width: 20,
        //                     child: Center(
        //                       child: CircularProgressIndicator(
        //                         color: Colors.pink.shade100,
        //                         strokeWidth: 2.0,
        //                       ),
        //                     ),
        //                   )
        //                 : Container(),
        //             onTap: model.processLogout,
        //           ),
        //         ),
        //         items: [
        //           SideMenuItem(
        //             priority: 0,
        //             title: 'Dashboard',
        //             onTap: () {
        //               pageController.jumpToPage(0);
        //             },
        //             icon: const Icon(Icons.home),
        //             badgeContent: const Text(
        //               '3',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             tooltipContent: "This is a tooltip for Dashboard item",
        //           ),
        //           SideMenuItem(
        //             priority: 1,
        //             title: 'Appointments',
        //             onTap: () {
        //               pageController.jumpToPage(1);
        //             },
        //             icon: const Icon(Icons.supervisor_account),
        //           ),
        //           SideMenuItem(
        //             priority: 2,
        //             title: 'Test',
        //             onTap: () {
        //               pageController.jumpToPage(2);
        //             },
        //             icon: const Icon(Icons.file_copy_rounded),
        //             trailing: Container(
        //                 decoration: const BoxDecoration(
        //                     color: Colors.amber,
        //                     borderRadius: BorderRadius.all(Radius.circular(6))),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                       horizontal: 6.0, vertical: 3),
        //                   child: Text(
        //                     'New',
        //                     style: TextStyle(
        //                         fontSize: 11, color: Colors.grey[800]),
        //                   ),
        //                 )),
        //           ),
        //           SideMenuItem(
        //             priority: 3,
        //             title: 'Profile',
        //             onTap: () {
        //               pageController.jumpToPage(3);
        //             },
        //             icon: const Icon(Icons.person),
        //           ),
        //           SideMenuItem(
        //             priority: 4,
        //             title: 'Medical history',
        //             onTap: () {
        //               pageController.jumpToPage(4);
        //             },
        //             icon: const Icon(Icons.history),
        //           ),
        //           SideMenuItem(
        //             priority: 5,
        //             title: 'Support',
        //             onTap: () {
        //               pageController.jumpToPage(5);
        //             },
        //             icon: const Icon(Icons.help),
        //           ),
        //           SideMenuItem(
        //             priority: 6,
        //             title: 'Logout',
        //             icon: const Icon(Icons.exit_to_app),
        //             trailing: model.isBusy
        //                 ? SizedBox(
        //                     height: 20,
        //                     width: 20,
        //                     child: Center(
        //                       child: CircularProgressIndicator(
        //                         color: Colors.pink.shade100,
        //                         strokeWidth: 2.0,
        //                       ),
        //                     ),
        //                   )
        //                 : Container(),
        //             onTap: model.processLogout,
        //           ),
        //         ],
        //       ),
        //       Expanded(
        //         child: PageView(
        //           controller: pageController,
        //           children: const [
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Dashboard large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Appointment large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Test large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Profile large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Medical history large view"),
        //               ),
        //             ),
        //             SingleChildScrollView(
        //               child: Center(
        //                 child: Text("Support large view"),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}

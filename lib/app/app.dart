import 'package:lab_management_app/core/services/app_theme_service.dart';
import 'package:lab_management_app/ui/views/dashboard/dashboard_view.dart';
import 'package:lab_management_app/ui/views/login/login_view.dart';
import 'package:lab_management_app/ui/views/signup/signup_view.dart';
import 'package:lab_management_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: DashboardView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Presolve(
      classType: AppThemeService,
      presolveUsing: AppThemeService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}

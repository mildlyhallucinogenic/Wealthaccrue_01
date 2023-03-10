import 'package:auto_route/auto_route.dart';
import 'package:wealthaccrue/pages/app_intro.dart';
import 'package:wealthaccrue/pages/auth_checker.dart';
import 'package:wealthaccrue/pages/basic_account.dart';
import 'package:wealthaccrue/pages/case_compare.dart';
import 'package:wealthaccrue/pages/case_details.dart';
import 'package:wealthaccrue/pages/case_display.dart';
import 'package:wealthaccrue/pages/email_sign_in.dart';
import 'package:wealthaccrue/pages/email_verify.dart';
import 'package:wealthaccrue/pages/holdings_page.dart';
import 'package:wealthaccrue/pages/home_page.dart';
import 'package:wealthaccrue/pages/name_details.dart';
import 'package:wealthaccrue/pages/onboard_screen.dart';
import 'package:wealthaccrue/pages/otp_verify.dart';
import 'package:wealthaccrue/extras/setup_lock_pin.dart';
import 'package:wealthaccrue/pages/verification_wait.dart';
import 'package:wealthaccrue/routers/auth_guard.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/pages/settings.dart';
import 'package:wealthaccrue/pages/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'UserRoute',
      page: BasicAccountPage,
      guards: [AuthGuard],
      children: [
        AutoRoute(
          // initial: true,
          path: 'account',
          name: 'AccountRouter',
          page: EmptyRouterPage,
          // guards: 
          children: [
            AutoRoute(path: '', page: HomePage),
            AutoRoute(path: 'settings', page: SettingsPage),
            AutoRoute(path: 'holdings', page: HoldingsPage),
          ],
        ),
        AutoRoute(
          path: 'compare',
          name: 'CompareRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CaseComparePage),
            // AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'cases',
          name: 'CasesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CaseDisplayPage),
            AutoRoute(path: 'details', page: CaseDetailsPage),
          ],
        ),
      ],
    ),
    AutoRoute<bool>(
      // initial: true,
      path: 'login',
      name: 'LoginRoute',
      page: EmptyRouterPage,
      children: [
        AutoRoute<bool>(path: '', page: OnboardPage),
        AutoRoute<bool>(path: 'wait', page: VerificationWaitingPage),
        AutoRoute<bool>(path: 'name', page: NameDetailsPage),
        AutoRoute<bool>(path: 'email', page: EmailLinkPage),
        AutoRoute<bool>(path: 'otp', page: OtpPage),
        AutoRoute<bool>(path: 'userPin', page: LockPinSetupPage),
      ],
    ),
    AutoRoute(
      path: 'splash',
      name: 'SplashRoute',
      page: SplashScreen,
    )
  ],
)
class $AppRouter {}

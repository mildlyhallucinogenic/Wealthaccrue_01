// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i16;

import '../extras/setup_lock_pin.dart' as _i15;
import '../pages/basic_account.dart' as _i1;
import '../pages/case_compare.dart' as _i7;
import '../pages/case_details.dart' as _i9;
import '../pages/case_display.dart' as _i8;
import '../pages/email_sign_in.dart' as _i13;
import '../pages/holdings_page.dart' as _i6;
import '../pages/home_page.dart' as _i4;
import '../pages/name_details.dart' as _i12;
import '../pages/onboard_screen.dart' as _i10;
import '../pages/otp_verify.dart' as _i14;
import '../pages/settings.dart' as _i5;
import '../pages/splash_page.dart' as _i3;
import '../pages/verification_wait.dart' as _i11;
import 'auth_guard.dart' as _i17;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i17.AuthGuard authGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    UserRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BasicAccountPage());
    },
    LoginRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SplashRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashScreen());
    },
    AccountRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CompareRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CasesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    SettingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    },
    HoldingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HoldingsPage());
    },
    CaseCompareRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CaseComparePage());
    },
    CaseDisplayRoute.name: (routeData) {
      final args = routeData.argsAs<CaseDisplayRouteArgs>(
          orElse: () => const CaseDisplayRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.CaseDisplayPage(key: args.key));
    },
    CaseDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CaseDetailsPage());
    },
    OnboardRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i10.OnboardPage());
    },
    VerificationWaitingRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i11.VerificationWaitingPage());
    },
    NameDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i12.NameDetailsPage());
    },
    EmailLinkRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i13.EmailLinkPage());
    },
    OtpRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: _i14.OtpPage());
    },
    LockPinSetupRoute.name: (routeData) {
      return _i2.MaterialPageX<bool>(
          routeData: routeData, child: const _i15.LockPinSetupPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(UserRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i2.RouteConfig(AccountRouter.name,
              path: 'account',
              parent: UserRoute.name,
              children: [
                _i2.RouteConfig(HomeRoute.name,
                    path: '', parent: AccountRouter.name),
                _i2.RouteConfig(SettingsRoute.name,
                    path: 'settings', parent: AccountRouter.name),
                _i2.RouteConfig(HoldingsRoute.name,
                    path: 'holdings', parent: AccountRouter.name)
              ]),
          _i2.RouteConfig(CompareRouter.name,
              path: 'compare',
              parent: UserRoute.name,
              children: [
                _i2.RouteConfig(CaseCompareRoute.name,
                    path: '', parent: CompareRouter.name)
              ]),
          _i2.RouteConfig(CasesRouter.name,
              path: 'cases',
              parent: UserRoute.name,
              children: [
                _i2.RouteConfig(CaseDisplayRoute.name,
                    path: '', parent: CasesRouter.name),
                _i2.RouteConfig(CaseDetailsRoute.name,
                    path: 'details', parent: CasesRouter.name)
              ])
        ]),
        _i2.RouteConfig(LoginRoute.name, path: 'login', children: [
          _i2.RouteConfig(OnboardRoute.name, path: '', parent: LoginRoute.name),
          _i2.RouteConfig(VerificationWaitingRoute.name,
              path: 'wait', parent: LoginRoute.name),
          _i2.RouteConfig(NameDetailsRoute.name,
              path: 'name', parent: LoginRoute.name),
          _i2.RouteConfig(EmailLinkRoute.name,
              path: 'email', parent: LoginRoute.name),
          _i2.RouteConfig(OtpRoute.name, path: 'otp', parent: LoginRoute.name),
          _i2.RouteConfig(LockPinSetupRoute.name,
              path: 'userPin', parent: LoginRoute.name)
        ]),
        _i2.RouteConfig(SplashRoute.name, path: 'splash')
      ];
}

/// generated route for
/// [_i1.BasicAccountPage]
class UserRoute extends _i2.PageRouteInfo<void> {
  const UserRoute({List<_i2.PageRouteInfo>? children})
      : super(UserRoute.name, path: '/', initialChildren: children);

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute({List<_i2.PageRouteInfo>? children})
      : super(LoginRoute.name, path: 'login', initialChildren: children);

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AccountRouter extends _i2.PageRouteInfo<void> {
  const AccountRouter({List<_i2.PageRouteInfo>? children})
      : super(AccountRouter.name, path: 'account', initialChildren: children);

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CompareRouter extends _i2.PageRouteInfo<void> {
  const CompareRouter({List<_i2.PageRouteInfo>? children})
      : super(CompareRouter.name, path: 'compare', initialChildren: children);

  static const String name = 'CompareRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CasesRouter extends _i2.PageRouteInfo<void> {
  const CasesRouter({List<_i2.PageRouteInfo>? children})
      : super(CasesRouter.name, path: 'cases', initialChildren: children);

  static const String name = 'CasesRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i6.HoldingsPage]
class HoldingsRoute extends _i2.PageRouteInfo<void> {
  const HoldingsRoute() : super(HoldingsRoute.name, path: 'holdings');

  static const String name = 'HoldingsRoute';
}

/// generated route for
/// [_i7.CaseComparePage]
class CaseCompareRoute extends _i2.PageRouteInfo<void> {
  const CaseCompareRoute() : super(CaseCompareRoute.name, path: '');

  static const String name = 'CaseCompareRoute';
}

/// generated route for
/// [_i8.CaseDisplayPage]
class CaseDisplayRoute extends _i2.PageRouteInfo<CaseDisplayRouteArgs> {
  CaseDisplayRoute({_i16.Key? key})
      : super(CaseDisplayRoute.name,
            path: '', args: CaseDisplayRouteArgs(key: key));

  static const String name = 'CaseDisplayRoute';
}

class CaseDisplayRouteArgs {
  const CaseDisplayRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CaseDisplayRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.CaseDetailsPage]
class CaseDetailsRoute extends _i2.PageRouteInfo<void> {
  const CaseDetailsRoute() : super(CaseDetailsRoute.name, path: 'details');

  static const String name = 'CaseDetailsRoute';
}

/// generated route for
/// [_i10.OnboardPage]
class OnboardRoute extends _i2.PageRouteInfo<void> {
  const OnboardRoute() : super(OnboardRoute.name, path: '');

  static const String name = 'OnboardRoute';
}

/// generated route for
/// [_i11.VerificationWaitingPage]
class VerificationWaitingRoute extends _i2.PageRouteInfo<void> {
  const VerificationWaitingRoute()
      : super(VerificationWaitingRoute.name, path: 'wait');

  static const String name = 'VerificationWaitingRoute';
}

/// generated route for
/// [_i12.NameDetailsPage]
class NameDetailsRoute extends _i2.PageRouteInfo<void> {
  const NameDetailsRoute() : super(NameDetailsRoute.name, path: 'name');

  static const String name = 'NameDetailsRoute';
}

/// generated route for
/// [_i13.EmailLinkPage]
class EmailLinkRoute extends _i2.PageRouteInfo<void> {
  const EmailLinkRoute() : super(EmailLinkRoute.name, path: 'email');

  static const String name = 'EmailLinkRoute';
}

/// generated route for
/// [_i14.OtpPage]
class OtpRoute extends _i2.PageRouteInfo<void> {
  const OtpRoute() : super(OtpRoute.name, path: 'otp');

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i15.LockPinSetupPage]
class LockPinSetupRoute extends _i2.PageRouteInfo<void> {
  const LockPinSetupRoute() : super(LockPinSetupRoute.name, path: 'userPin');

  static const String name = 'LockPinSetupRoute';
}

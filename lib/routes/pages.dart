
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/create_account/bloc/signup_blocs.dart';
import 'package:untitled/screens/create_account/signup.dart';
import 'package:untitled/screens/home/bloc/home_screen_blocs.dart';
import 'package:untitled/screens/home/home_screen.dart';
import 'package:untitled/screens/login/bloc/sign_in_blocs.dart';
import 'package:untitled/screens/login/sign_in.dart';
import 'package:untitled/screens/onboarding/bloc/onboarding_blocs.dart';
import 'package:untitled/screens/onboarding/get_started.dart';
import 'package:untitled/screens/settings/settings_screen.dart';
import '../global.dart';
import '../screens/app_dashboard/app_dashboard.dart';
import '../screens/app_dashboard/bloc/app_blocs.dart';
import '../screens/profile/bloc/profile_bloc.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/bloc/settings_blocs.dart';
import 'names.dart';

class AppPages{
  static List<PageEntity> routes() {
    return [

      PageEntity(page: const GetStarted(), route: AppRoutes.getStarted,
          bloc: BlocProvider(create: (_) => OnboardingBloc(),)),

      PageEntity(page: const SignUp(), route: AppRoutes.signUp,
          bloc: BlocProvider(create: (_) => SignUpBlocs(),)),

      PageEntity(page: const SignIn(), route: AppRoutes.signIn,
          bloc: BlocProvider(create: (_) => SignInBlocs(),)),

      PageEntity(page: const AppDashboard(), route: AppRoutes.appDashboard,
          bloc: BlocProvider(create: (_) => AppBlocs(),)),

      PageEntity(page: const HomeScreen(), route: AppRoutes.homeScreen,
          bloc: BlocProvider(create: (_) => HomeScreenBlocs(),)),

      PageEntity(page: const ProfileScreen(), route: AppRoutes.profile,
          bloc: BlocProvider(create: (_) => ProfileBlocs(),)),

       PageEntity(page: const SettingsScreen(), route: AppRoutes.settings,
          bloc: BlocProvider(create: (_) => SettingsBlocs(),)),


    ];
  }

//return all bloc providers
   static List<dynamic> allBlocProviders(BuildContext context) {
      List<dynamic> blocProviders = <dynamic>[];
      for (var bloc in routes()) {
        blocProviders.add(bloc.bloc);

      }
      return blocProviders;
    }

    static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      //check if route name match when navigator is triggered
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        print(result.first.route);
        print('First log');
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.getStarted && deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_) => const AppDashboard(),
                settings: settings);
          }

          return MaterialPageRoute(builder: (_) => const SignIn(),
              settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page,
            settings: settings);
      }
    }
    print('invalid route is ${settings.name}');
    return MaterialPageRoute(builder: (_) => const SignUp());
    }
  }
//integrate bloc,routes and screens
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

 PageEntity({
    required this.page, required this.bloc, required this.route
});
}
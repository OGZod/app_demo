import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/global.dart';
import 'package:untitled/routes/pages.dart';
import 'package:untitled/screens/onboarding/get_started.dart';
import 'package:untitled/values/colors.dart';

Future<void> main() async{
  await Global.init();
  runApp(const AppDemo());
}
class AppDemo extends StatelessWidget {
  const AppDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return  MaterialApp(
            builder: EasyLoading.init(),
            theme: ThemeData(
              //useMaterial3: true,
              appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: white,
              statusBarIconBrightness: Brightness.dark,
              )
            ),),

            title: 'bakeEat',
            debugShowCheckedModeBanner: false,
            onGenerateRoute:AppPages.generateRouteSettings ,
          );
        },
      ),
    );
  }
}

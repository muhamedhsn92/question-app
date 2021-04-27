import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:question_app/layout/news_layout/cubit/cubit.dart';
import 'package:question_app/layout/news_layout/cubit/states.dart';
import 'package:question_app/layout/wefix_layout/wefix_home_layout.dart';
import 'package:question_app/shared/components/constants.dart';
import 'package:question_app/shared/cubit/cubit.dart';
import 'package:question_app/shared/cubit/states.dart';
import 'package:question_app/shared/network/local/cache_herlper.dart';
import 'package:question_app/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './modules/login/login_screen.dart';
import './modules/messenger/messenger_screen.dart';
import './modules/users/users_screen.dart';
import './modules/counter/counter_screen.dart';
import './modules/bmi/bmi_calculator_screen.dart';
import './modules/bmi_result/bmi_result_screen.dart';
import 'layout/news_layout/news_layout.dart';
import 'layout/todo_layout/todo_layout.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            title: 'Flutter Demp',
            // this themeData for all application style
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: cubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//      home: MyHomePage(),
//      home: LoginScreen(),
//      home: MessengerScreen(),
//      home: UsersScreen(),
//      home: CounterScreen(),
//      home: BmiCalculatorScreen(),
//      home: BmiResultScreen(),
//       home: HomeLayout(),
//       home: WefixHomeLayout(),
            home: NewsLayout(),
            //using RTL - LTR
            // Directionality(
            //   textDirection: TextDirection.rtl,
            //   child: NewsLayout(),
            // ) ,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('app bar top '),
//          backgroundColor: Color.fromARGB(255, 200, 122, 50),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
          child: Center(
            child: Text(
              'data',
              style: TextStyle(color: Colors.white, fontSize: 80),
            ),
          ),
        ));
  }
}
// https://w7.pngwing.com/pngs/708/311/png-transparent-icon-logo-twitter-logo-twitter-logo-blue-social-media-area-thumbnail.png

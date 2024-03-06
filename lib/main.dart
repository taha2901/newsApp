import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapi/cubits/change_cubit/changes_cubit.dart';
import 'package:newsapi/cubits/news_cubit/news_cubit.dart';
import 'package:newsapi/helper/api.dart';
import 'package:newsapi/helper/cach.dart';
import 'package:newsapi/layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  bool? isDark = ChachHelper.getBoolean(key: 'isDark') ?? true;
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider(
          create: (context) =>
              ChangesCubit()..changeAppMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<ChangesCubit, ChangesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Colors.white,
                  elevation: 30.0),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarBrightness: Brightness.light,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 30.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            themeMode: BlocProvider.of<ChangesCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}

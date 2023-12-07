// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pictures_app/network/network_servis.dart';
// import 'package:pictures_app/ui/pages/splash_page/splash_page.dart';
//
// import 'cubit/photo/photo_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pictures_app/ui/pages/category_page/category_page.dart';
import 'package:pictures_app/ui/pages/main_page/main_page.dart';
import 'package:pictures_app/ui/pages/splash_page/splash_page.dart';

import 'cubit/photo/photo_cubit.dart';
import 'network/network_servis.dart';
// import 'network/network_servis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoCubit(NetworkService()),
      child: MaterialApp(
        routes: {
          "/":(context)=>SplashPage(),
          "/main":(context)=>MainPage(),
          "/search":(context)=>CategoryPage(query: "query")

        },
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/":
              return CupertinoPageRoute(
                builder: (context) => SplashPage(),
              );
            case "/mainPage":
              return CupertinoPageRoute(
                builder: (context) => MainPage(),
              );
            case "/categoryPage":
              return CupertinoPageRoute(
                builder: (context) =>
                    CategoryPage(query: settings.arguments as String),
              );
          }
        },
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SplashPage(),
      ),
    );
  }
}

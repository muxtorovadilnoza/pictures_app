import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pictures_app/cubit/splash_cubit.dart';

import '../../../cubit/splash_state.dart';
import '../main_page/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startTimer()  ,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
    if(state is SplshEnd){
      Navigator.pushReplacementNamed(
        context,
        "/mainPage",
      );
    }
        },
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

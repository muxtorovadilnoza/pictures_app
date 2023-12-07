import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pictures_app/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{

  SplashCubit():super(SplashInitial());
 late Timer timer;
  startTimer(){
 Future.delayed(const Duration(seconds: 3),(){
   emit(SplshEnd());
 }
 );
  }
}
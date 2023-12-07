import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/photo/photo_cubit.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.src});

final  String  src;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
        Image.network
        (src,fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
          Align(
            alignment:Alignment.bottomCenter,
            child: TextButton(onPressed: (){
           context.read<PhotoCubit>().donloadPhoto(src);
            },child: Text("Danload"),),
          )
        ]
      ),


    );
  }
}

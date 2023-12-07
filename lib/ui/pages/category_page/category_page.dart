import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pictures_app/cubit/photo/photo_cubit.dart';
import 'package:pictures_app/cubit/photo/photo_cubit.dart';

import '../../../cubit/photo/photo_state.dart';

class CategoryPage extends StatelessWidget {


  const CategoryPage({super.key,required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCubit, PhotoState>(
      bloc: context.read<PhotoCubit>()..searchPhotos(query),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
body: getBody(state),
        );
      },
    );
  }
}
Widget getBody(PhotoState state) {
  if (state .status==Status.loding) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else if (state.status==Status.loding) {
    var list = state.categoryPhotos?.photos;

    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        return Image.network(list![index].src?.medium ?? "");
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  } else if (state.status==Status.error) {
    return Center(
      child: Text("Error"),
    );
  } else {
    return Center(
      child: Text("PhotoInitial"),
    );
  }

  return Container(); // Return a default container or any other widget.
}
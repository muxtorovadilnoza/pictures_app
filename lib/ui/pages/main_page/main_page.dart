// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import '../../../cubit/photo/photo_cubit.dart';
// import '../../../cubit/photo/photo_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pictures_app/ui/pages/category_page/category_page.dart';

import '../../../cubit/photo/photo_cubit.dart';
import '../../../cubit/photo/photo_state.dart';
import '../../imagePage.dart';

class MainPage extends StatelessWidget {
   MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    List list = [
      "Car",
      "Street Art",
      "Wind life",
      "Nature",
      "Flower",
      "City",
      "Winter",
      "Baby",
      "Book"
    ];
    List<String> filteredList = [];
    List list1 = [
      "assets/img.png_1",
      "assets/img.png",
      "assets/img.png_4",
      "assets/img.png_5",
      "assets/img.png_6",
      "assets/img.png_2",
      "assets/img.png_3"
    ];
    return BlocBuilder<PhotoCubit, PhotoState>(
      bloc: context.read<PhotoCubit>()..getPhotos(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Pixels App",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500),
            )),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[300]),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    hintText: 'flutter',
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          for (var index = 0; index < list.length; index++)
                            TextButton(
                              onPressed: () {
                                navigateToCategory(context, list[index]);
                              },
                              child: Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage('assets/img.png'),

                                      fit: BoxFit
                                          .cover, // You can adjust the fit as needed
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "${list[index]} ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ))),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: getBody(state),
              ),
            ],
          ),
        );
      },
    );
  }

   navigateToCategory(BuildContext context, dynamic query) {
     return Navigator.pushNamed(
         context,
         "/categoryPage"  , arguments: query
     );
   }



  Widget getBody(PhotoState state) {
    if (state.status==Status.loding) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.status==Status.loaded) {
      var list = state.photoResponse?.photos;

      return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        itemCount: list?.length ?? 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ImagePage(src: list[index].src?.large ?? "",))
                  );
            },
              child: Image.network(list![index].src?.medium ?? ""));
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      );
    } else if (state.status==Status.error) {
      return Center(
        child: Text("Error"),
      );
    } else  {
      return Center(
        child: Text("PhotoInitial"),
      );
    }

    return Container(); // Return a default container or any other widget.
  }
}

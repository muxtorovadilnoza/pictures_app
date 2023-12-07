// import 'package:bloc/bloc.dart';
// import 'package:pictures_app/cubit/search/seatch_state.dart';
// import 'package:pictures_app/cubit/search/seatch_state.dart';
// // import 'package:pictures_app/cubit/search/seatch_state.dart';
// // import 'package:pictures_app/cubit/search/seatch_state.dart';
// // import 'package:pixels_app/cubit/photo/photo_cubit.dart';
// // import 'package:pixels_app/model/photo_response.dart';
// // import 'package:pixels_app/service/network_service.dart';
//
// import '../../model/picturesModel.dart';
// import '../../network/network_servis.dart';
// import '../photo/photo_cubit.dart';
//
// part 'search_state.dart';
//
// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit(this.networkService) : super(SearchState());
//   final NetworkService networkService;
//
//   searchPhotos(String query) async {
//     emit(state.copyWith(status: Status.loading));
//     PhotoResponse? photoResponse =
//     await networkService.searchPhotosModel(query);
//     if (photoResponse != null) {
//       emit(
//         state.copyWith(
//           status: Status.loaded,
//           photoResponse: photoResponse,
//         ),
//       );
//     } else {
//       emit(
//         state.copyWith(
//           status: Status.error,
//         ),
//       );
//     }
//   }
// }

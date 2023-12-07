import 'package:bloc/bloc.dart';
import 'package:pictures_app/cubit/photo/photo_state.dart';
import 'package:pictures_app/network/network_servis.dart';

import '../../model/picturesModel.dart';
enum Status{
  loding,loaded,error,
}
class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this.networkServis) :super(PhotoState());
  final NetworkService networkServis;

  getPhotos() async {
    emit(state.copyWith(status:Status.loding ));
    PhotoResponse? photoResponse = await networkServis.getPhotosModel();
    if (photoResponse != null) {
      emit(
          state.copyWith(
        status: Status.loaded,
          photoResponse: photoResponse));
    }
    else {
      emit(state.copyWith(status: Status.error));
    }
  }
  searchPhotos( String query) async {
    emit(state.copyWith(status:Status.loding));
    PhotoResponse? photoResponse = await networkServis.searchPhotosModel(query);
    if (photoResponse != null) {

      emit(state.copyWith(status:Status.loaded,
          categoryPhotos: photoResponse));
    }
    else {
      emit(state.copyWith (status: Status.error));
    }
  }

  donloadPhoto(String url){
    networkServis.download(url);

  }

}
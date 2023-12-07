import 'package:pictures_app/cubit/photo/photo_cubit.dart';

import '../../model/picturesModel.dart';

 class PhotoState{
 final Status? status;
final PhotoResponse?photoResponse;
final PhotoResponse? categoryPhotos;
PhotoState({this.status, this.photoResponse, this.categoryPhotos});

PhotoState copyWith({
    Status? status,
    PhotoResponse? photoResponse,
    PhotoResponse? categoryPhotos,
  }){
  return PhotoState(status:status??this.status,
      photoResponse:photoResponse??photoResponse,
      categoryPhotos:categoryPhotos??categoryPhotos);

}
}







// class PhotoInitial extends PhotoState{}
// class PhotoLoadInProgress extends PhotoState{}
// class PhotoLoadSuccess extends PhotoState{
//   final PhotoResponse? photoResponse;
//   final PhotoResponse ?categoryPhotos;
//   PhotoLoadSuccess({this.photoResponse, this.categoryPhotos});
// }
// class PhotoSearchLoadSuccess extends PhotoState{
//   final PhotoResponse photoResponse;
//   PhotoSearchLoadSuccess(this.photoResponse);
// }
// class PhotoLoadError extends PhotoState{}
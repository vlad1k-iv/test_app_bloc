import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_bloc/api/photos_api/photos_api.dart';
import 'package:test_app_bloc/cubit/base_cubit.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_state.dart';

class PhotosCubit extends Cubit<BaseState>{
  PhotosCubit() : super(InitialState());

  PhotosApi _client = PhotosApi();
  Future<void> getListPhotos() async{
    try {
      emit(LoadingState());
      var response = await _client.getListPhotos();
      emit(SuccessGetPhotosState(model: response));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}

class PhotoCubit extends Cubit<BaseState>{
  PhotoCubit() : super(InitialState());

  PhotosApi _client = PhotosApi();

  Future<void> getPhotoById(String id) async{
    try {
      emit(LoadingState());
      var response = await _client.getPhotoById(id);
      emit(SuccessGetPhotoIdState(model: response));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
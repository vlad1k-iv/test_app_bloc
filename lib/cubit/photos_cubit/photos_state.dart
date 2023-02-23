import 'package:test_app_bloc/cubit/base_cubit.dart';
import 'package:test_app_bloc/models/list_photos_model.dart';
import 'package:test_app_bloc/models/photo_model.dart';

class SuccessGetPhotosState extends BaseState{
final List<ListPhotosModel> model;

SuccessGetPhotosState({required this.model});
}

class SuccessGetPhotoIdState extends BaseState{
final PhotoModel model;

SuccessGetPhotoIdState({required this.model});
}
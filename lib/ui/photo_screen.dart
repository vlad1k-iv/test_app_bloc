import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_bloc/cubit/base_cubit.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_cubit.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_state.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key, required this.id});
  final String id;
  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<PhotoCubit>().getPhotoById(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PhotoCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuccessGetPhotoIdState) {
          return Image.network(
            state.model.urls?.full ?? '',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
    ));
  }
}

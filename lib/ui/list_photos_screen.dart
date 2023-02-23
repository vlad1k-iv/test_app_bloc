import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_bloc/cubit/base_cubit.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_cubit.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_state.dart';
import 'package:test_app_bloc/ui/photo_screen.dart';

class ListPhotosScreen extends StatefulWidget {
  const ListPhotosScreen({super.key});

  @override
  State<ListPhotosScreen> createState() => _ListPhotosScreenState();
}

class _ListPhotosScreenState extends State<ListPhotosScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<PhotosCubit>().getListPhotos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: const Text('Photos')),
        body: BlocConsumer<PhotosCubit, BaseState>(
          builder: ((context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SuccessGetPhotosState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoScreen(
                                    id: state.model[index].id ?? '',
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(26, 40, 39, 39),
                        ),
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        width: size.width - 30,
                        child: Column(children: [
                          Image.network(
                            state.model[index].urls?.small ?? '',
                            fit: BoxFit.cover,
                            width: size.width - 30,
                            height: 200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.model[index].description ?? '',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            state.model[index].user?.name ?? '',
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ),
                  );
                },
                itemCount: 10,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              );
            }

            return SizedBox();
          }),
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ));
  }
}

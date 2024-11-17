import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements/constants/my_app_constants.dart';
import 'package:mvvm_statemanagements/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements/model/movies_model.dart';
import 'package:mvvm_statemanagements/repository/movies_repo.dart';
import 'package:mvvm_statemanagements/screen/favorites_screen.dart';
import 'package:mvvm_statemanagements/service/api_service.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';
import 'package:mvvm_statemanagements/service/navigation_service.dart';
import 'package:mvvm_statemanagements/widgets/cached_image.dart';
import '../model/genres_model.dart';
import '../widgets/movies_widget.dart/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
              onPressed: () {
                getIt<NavigationService>().showDialog(const FavoritesScreen());
                // getIt<NavigationService>().showSnackbar();
              },
              icon: const Icon(
                MyAppIcons.favoriteRounded,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () async {
                await getIt<MoviesRepository>().fetchMovies();
              },
              icon: const Icon(MyAppIcons.darkMode))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: MoviesWidget(),
          );
        },
      ),
    );
  }
}

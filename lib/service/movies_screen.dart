import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements/constants/my_app_constants.dart';
import 'package:mvvm_statemanagements/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements/widgets/cached_image.dart';

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
              onPressed: () {},
              icon: const Icon(
                MyAppIcons.favoriteRounded,
                color: Colors.red,
              )),
          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.darkMode))
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

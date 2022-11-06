import 'package:flutter/material.dart';
import 'ui/movie_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieList(),
    );
  }
}

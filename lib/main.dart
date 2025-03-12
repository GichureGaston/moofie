import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moofie/presentation/blocs/movie/movie_bloc.dart';
import 'package:moofie/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieBloc()..add(GetMoviePageEvent()),
      child: BlocBuilder<MovieBloc, MoviePageState>(
        builder: _buildMoviePage,
      ),
    );
  }

  Widget _buildMoviePage(BuildContext context, MoviePageState state) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 4, child: HomeScreen()),
    );
  }
}

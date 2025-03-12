import 'package:flutter/material.dart';
import 'package:moofie/presentation/screens/favourites_screen.dart';
import 'package:moofie/presentation/screens/search_screen.dart';
import 'package:moofie/presentation/widgets/downloads_page.dart';
import 'package:moofie/presentation/widgets/movie_card.dart';

import '../../network/network_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeShell(),
    SearchScreen(),
    FavouritesScreen(),
    DownloadsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline),
            label: 'Downloads',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: MovieService.fetchPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 4.0,
                    title: const Text(
                      '🎬 Movie Night',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    expandedHeight: 400,
                    floating: true,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => MovieCard(
                                movie: movies![0],
                                onDownload: () => print('Download tapped'),
                                onFavorite: () => print('Favorite tapped'),
                                onShare: () => print('Share tapped'),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          padding: const EdgeInsets.all(8),
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.movie_filter_rounded,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final movie = movies?[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: MovieCard(
                              movie: movie!,
                              onDownload: () => print('Download ${movie.name}'),
                              onFavorite: () => print('Favorite ${movie.name}'),
                              onShare: () => print('Share ${movie.name}'),
                            ),
                          );
                        },
                        childCount: movies?.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies?.length,
                          itemBuilder: (context, index) {
                            final movie = movies?[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Stack(
                                  children: [
                                    // if (movie?.imageUrl != null)
                                    //   Image.network(
                                    //     movie!.imageUrl!,
                                    //     width: 150,
                                    //     height: 200,
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    Container(
                                      width: 150,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.6),
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: Text(
                                        movie?.name ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

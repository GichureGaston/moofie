import 'package:flutter/material.dart';

import '../../data/models/movie_card_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onDownload;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;

  const MovieCard({
    super.key,
    required this.movie,
    this.onDownload,
    this.onFavorite,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMovieImage(),
          _buildMovieInfo(),
          _buildActionButtons(),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildMovieImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        // image: movie.imageUrl != null
        //     ? DecorationImage(
        //         image: NetworkImage(movie.imageUrl!),
        //         fit: BoxFit.cover,
        //       )
        //     : null,
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.name.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildInfoChips(),
        ],
      ),
    );
  }

  Widget _buildInfoChips() {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        _buildChip(
          icon: Icons.star,
          label: '${movie.iso6391}',
          backgroundColor: Colors.amber,
        ),
        _buildChip(
          icon: Icons.hd,
          label: movie.id.toString(),
        ),
        _buildChip(
          icon: Icons.movie,
          label: movie.iso6391.toString(),
        ),
        _buildChip(
          icon: Icons.calendar_today,
          label: movie.favoriteCount.toString(),
        ),
      ],
    );
  }

  Widget _buildChip({
    required IconData icon,
    required String label,
    Color? backgroundColor,
  }) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      backgroundColor: backgroundColor ?? Colors.grey[200],
      labelStyle: TextStyle(
        color: backgroundColor != null ? Colors.white : Colors.black87,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            icon: Icons.download,
            label: 'Download',
            onPressed: onDownload,
          ),
          _buildActionButton(
            icon: Icons.favorite_border,
            label: 'Favorite',
            onPressed: onFavorite,
          ),
          _buildActionButton(
            icon: Icons.share,
            label: 'Share',
            onPressed: onShare,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        movie.description.toString(),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// Example usage
class MovieCardExample extends StatelessWidget {
  const MovieCardExample({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: MovieCard(
          movie: movie,
          onDownload: () {},
          onFavorite: () {},
          onShare: () {},
        ),
      ),
    );
  }
}

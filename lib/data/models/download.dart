class Download {
  final String title;
  final String subtitle;
  final double progress;
  final bool isCompleted;

  Download({
    required this.title,
    required this.subtitle,
    this.progress = 0.0,
    this.isCompleted = false,
  });
}
